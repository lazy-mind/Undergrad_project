# Generated by Django 2.0.5 on 2018-05-11 05:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0003_auto_20160828_1656'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='authorid',
            field=models.CharField(db_index=True, default='', max_length=255),
        ),
    ]