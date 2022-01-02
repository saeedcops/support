var dir = document.getElementsByTagName("html")[0].getAttribute("dir");
var notify_badge_class;
var notify_menu_class;
var notify_api_url;
var notify_fetch_count;
var notify_unread_url;
var notify_mark_all_unread_url;
var notify_refresh_period = 15000;
var consecutive_misfires = 0;
var registered_functions = [];
var unread_count_temp = 0;



function showNotification(data) {
    // console.log("Show");
    const notification = new Notification(data.unread_list[0].actor, {
        body: data.unread_list[0].verb,
        icon: "/img/" + data.unread_list[0].description,
    });

    notification.onclick = (e) => {



        if (dir === "ltr") {
            window.location.href = "/en" + data.unread_list[0].data.data;
        } else {
            window.location.href = "/ar" + data.unread_list[0].data.data;
        }
    };
}

function popUpNotification(data) {
    // console.log("check");
    if (Notification.permission === "granted") {
        showNotification(data);
        // console.log("granted");
    } else if (Notification.permission !== "denied") {

        // console.log("Requst");
        Notification.requestPermission().then(permission => {
            if (permission === "granted") {
                showNotification(data);
            }
        });
    }

}

function fill_notification_badge(data) {
    var badges = document.getElementsByClassName(notify_badge_class);
    if (badges) {
        // console.log("Badge");
        unread_count_temp = localStorage.getItem("unread_count");
        if (data.unread_count > unread_count_temp) {
            // console.log("New");
            unread_count_temp = data.unread_count;
            localStorage.setItem("unread_count", unread_count_temp);
            popUpNotification(data);

        }
        // console.log("data", data);
        for (var i = 0; i < badges.length; i++) {
            badges[i].innerHTML = data.unread_count;
        }
    }
}

function fill_notification_list(data) {

    var notificationWrapper = document.querySelector(".notifications-wrapper");
    var menus = document.getElementsByClassName(notify_menu_class);
    // menus.setAttribute("style","width:50px");
    // menus.style.width='500px';
    if (notificationWrapper) {


        var messages = data.unread_list.map(function(item) {

            // console.log("data1", item);
            // console.log("data2", item.data.data);
            return '<li onclick=clickedItem(this)><div class="row"><img src="https://osg-support.cops.com/img/' + item.description + '" alt="">  \
                    <h5>' + item.actor + ' </h5></div><p>' + item.verb + '</p><h1 style="display:none">' + item.data.data + '</h1></li><hr/>';
        }).join('');

        notificationWrapper.innerHTML = messages;

    }
}

function clickedItem(li) {
    // console.log("CKlick");
    var cell = li.getElementsByTagName("h1")[0];
    var id = cell.innerHTML;
    // console.log(id);

    if (dir === "ltr") {
        window.location.href = "/en" + id;
    } else {
        window.location.href = "/ar" + id;
    }
}

function register_notifier(func) {
    // console.log("register_notifier");
    registered_functions.push(func);
}

function fetch_api_data() {
    if (registered_functions.length > 0) {
        //only fetch data if a function is setup
        var r = new XMLHttpRequest();
        var data = null;
        r.addEventListener('readystatechange', function(event) {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    consecutive_misfires = 0;
                    data = JSON.parse(r.responseText);
                    // console.log("data", data);
                    // if(data.unread_count==0){
                    //     r.open("GET", "/inbox/notifications/api/all_list/", true);
                    //     r.send();
                    // }
                    registered_functions.forEach(function(func) { func(data); });
                } else {
                    consecutive_misfires++;
                }
            }
        });
        r.open("GET", notify_api_url + '?max=' + notify_fetch_count, true);
        // r.open("GET", notify_api_url+'?max='+notify_fetch_count+"&mark_as_read=true", true);
        r.send();

    }
    if (consecutive_misfires < 10) {
        setTimeout(fetch_api_data, notify_refresh_period);
    } else {
        var badges = document.getElementsByClassName(notify_badge_class);
        if (badges) {
            for (var i = 0; i < badges.length; i++) {
                badges[i].innerHTML = "!";
                badges[i].title = "Connection lost!"
            }
        }
    }
}

setTimeout(fetch_api_data, 1000);