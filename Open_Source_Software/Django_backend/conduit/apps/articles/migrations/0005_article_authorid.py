# Generated by Django 2.0.5 on 2018-05-11 05:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0004_auto_20180511_0504'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='authorid',
            field=models.CharField(db_index=True, default='', max_length=255),
        ),
    ]
