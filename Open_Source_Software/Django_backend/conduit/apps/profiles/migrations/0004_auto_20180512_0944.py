# Generated by Django 2.0.5 on 2018-05-12 09:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('profiles', '0003_profile_favorites'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='image',
            field=models.FileField(upload_to=''),
        ),
    ]
