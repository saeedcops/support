# Generated by Django 3.2.6 on 2021-10-31 20:01

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='AdminProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=50)),
                ('phone', models.CharField(max_length=15)),
                ('position', models.CharField(max_length=20)),
            ],
            options={
                'ordering': ['-name'],
            },
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
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sender', models.IntegerField(default=1)),
                ('text', models.TextField()),
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
                ('department', models.CharField(max_length=10)),
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
                ('priority', models.IntegerField()),
                ('open_date', models.DateField(default=django.utils.timezone.now)),
                ('closed_date', models.DateField(blank=True, null=True)),
                ('description', models.TextField()),
                ('admin', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='core.adminprofile')),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.branch')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.category')),
                ('pc', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='core.pc')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='userticket', to='core.userprofile')),
            ],
            options={
                'ordering': ['-open_date'],
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
