# Generated by Django 2.0 on 2018-11-08 14:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20181108_1428'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.CharField(choices=[('register', '注册'), ('forget', '找回密码'), ('update', '修改邮箱')], max_length=30, verbose_name='发送类型'),
        ),
    ]
