from core.models import Ticket
from django import forms
class TicketCreateForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields=[
            'description',
            'category',
            ]
        exclude = ('user','admin','closed_date',)

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user')
        super(TicketCreateForm, self).__init__(*args, **kwargs)

    # def clean_title(self):
    #     title = self.cleaned_data['title']
    #     if Book.objects.filter(user=self.user, title=title).exists():
    #         raise forms.ValidationError("You have already written a book with same title.")
    #     return title