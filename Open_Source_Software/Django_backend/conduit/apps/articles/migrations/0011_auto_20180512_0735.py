# Generated by Django 2.0.5 on 2018-05-12 07:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0010_auto_20180512_0733'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='end_time',
            field=models.TimeField(blank=True, default='23:59:59'),
        ),
        migrations.AlterField(
            model_name='article',
            name='start_time',
            field=models.TimeField(blank=True, default='00:00:00'),
        ),
    ]