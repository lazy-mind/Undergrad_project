# Generated by Django 2.0.5 on 2018-05-11 13:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0007_article_members'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='score',
            field=models.CharField(db_index=True, default='0', max_length=255),
        ),
    ]