# Generated by Django 3.2.6 on 2021-12-08 08:54

import core.models
from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('phone', models.CharField(blank=True, max_length=20)),
                ('ip', models.CharField(blank=True, max_length=20)),
                ('department', models.CharField(blank=True, max_length=20, null=True)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='AdminProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=50)),
                ('phone', models.CharField(max_length=15)),
                ('position', models.CharField(max_length=20)),
                ('image', models.ImageField(blank=True, null=True, upload_to=core.models.user_image_path)),
            ],
            options={
                'ordering': ['-name'],
            },
        ),
        migrations.CreateModel(
            name='AppPermission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('permission', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Branch',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
            options={
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sender', models.IntegerField(default=1)),
                ('name', models.CharField(default=' ', max_length=50)),
                ('text', models.TextField()),
                ('date', models.DateField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='PC',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_name', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('switch_port', models.IntegerField(default=0)),
                ('vlan', models.IntegerField(default=0)),
                ('ram', models.IntegerField(default=0)),
                ('cpu', models.CharField(max_length=10)),
                ('hard_disk', models.CharField(max_length=10)),
                ('os', models.CharField(max_length=10)),
                ('mac', models.CharField(max_length=17)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
                ('department', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.department')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='userprofile', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-host_name'],
            },
        ),
        migrations.CreateModel(
            name='Server',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_name', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('switch_port', models.IntegerField(default=0)),
                ('vlan', models.IntegerField(default=0)),
                ('ram', models.IntegerField(default=0)),
                ('cpu', models.CharField(max_length=10)),
                ('hard_disk', models.CharField(max_length=10)),
                ('os', models.CharField(max_length=50)),
                ('mac', models.CharField(max_length=17)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('role', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
            ],
            options={
                'ordering': ['-host_name'],
            },
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=200)),
                ('department', models.CharField(blank=True, max_length=15, null=True)),
                ('phone', models.CharField(blank=True, max_length=15, null=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to=core.models.user_image_path)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch')),
                ('pc', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.pc')),
                ('user', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-department'],
            },
        ),
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(default='open', max_length=10)),
                ('open_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('closed_date', models.DateTimeField(blank=True, null=True)),
                ('description', models.TextField()),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='core.adminprofile')),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.branch')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.category')),
                ('messages', models.ManyToManyField(to='core.Message')),
                ('pc', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.pc')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='userticket', to='core.userprofile')),
            ],
            options={
                'ordering': ['-status'],
            },
        ),
        migrations.CreateModel(
            name='Switch',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_name', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('port_number', models.IntegerField(default=24)),
                ('vlan', django.contrib.postgres.fields.ArrayField(base_field=django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), size=None), size=None)),
                ('trunk_ports', django.contrib.postgres.fields.ArrayField(base_field=django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), size=None), size=None)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('role', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
            ],
            options={
                'ordering': ['-host_name'],
            },
        ),
        migrations.CreateModel(
            name='Share',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('path', models.CharField(max_length=100)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.branch')),
                ('server', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.server')),
            ],
        ),
        migrations.CreateModel(
            name='Request',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valid', models.BooleanField(default=False)),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('file_scan', models.FileField(blank=True, null=True, upload_to=core.models.user_directory_path)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='branchrequest', to='core.branch')),
                ('category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='userrequest', to='core.category')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='userrequest', to='core.userprofile')),
            ],
            options={
                'ordering': ['-date'],
            },
        ),
        migrations.CreateModel(
            name='Printer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kind', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('switch_port', models.IntegerField(default=0)),
                ('vlan', models.IntegerField(default=0)),
                ('mac', models.CharField(max_length=17)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('role', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
                ('connected_pc', models.ManyToManyField(to='core.PC')),
            ],
            options={
                'ordering': ['-ip'],
            },
        ),
        migrations.CreateModel(
            name='Permission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('apps', models.ManyToManyField(to='core.Category')),
                ('share', models.ManyToManyField(related_name='usershare', to='core.Share')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='userpro', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Firewall',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_name', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('port_numbers', models.IntegerField(default=12)),
                ('gatewaies', models.CharField(max_length=255)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('role', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
            ],
            options={
                'ordering': ['-host_name'],
            },
        ),
        migrations.CreateModel(
            name='FingerPrint',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.CharField(max_length=15)),
                ('switch_port', models.IntegerField(default=0)),
                ('vlan', models.IntegerField(default=99)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('location', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
            ],
            options={
                'ordering': ['-ip'],
            },
        ),
        migrations.CreateModel(
            name='DVR',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_name', models.CharField(max_length=15)),
                ('ip', models.CharField(max_length=15)),
                ('switch_port', models.IntegerField(default=0)),
                ('cams', models.IntegerField(default=0)),
                ('vlan', models.IntegerField(default=99)),
                ('model', models.CharField(max_length=20)),
                ('serial_num', models.CharField(max_length=17)),
                ('location', models.CharField(max_length=30)),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.branch', verbose_name='Branch')),
            ],
            options={
                'ordering': ['-host_name'],
            },
        ),
        migrations.AddField(
            model_name='adminprofile',
            name='branch',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.branch'),
        ),
        migrations.AddField(
            model_name='adminprofile',
            name='pc',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='core.pc'),
        ),
        migrations.AddField(
            model_name='adminprofile',
            name='user',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to=settings.AUTH_USER_MODEL),
        ),
    ]
