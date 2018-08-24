# 環境の予約
[ホスティッドICPトライアル環境](https://www.ibm.com/cloud/garage/tutorials/ibm-cloud-private-trial/ibm-cloud-private-hosted-trial)
のページから、環境の予約を行ってください。
最大１週間まで無償で利用することが可能です。

# 環境へのアクセス
**重要：2時間の休止後、環境はサスペンドされます。作業を再開するには、右上隅の再生アイコンをクリックします。再起動処理には10〜15分かかります。**

1. 予約フォームを完了して数分後、予約した環境に関する指示が記載された電子メールを受信トレイで確認してください。指示に従って、インスタンスにログインします。
1. 初めて自分の環境にログインすると、VMがサスペンドされていることもあります。開始するには、右上隅の再生アイコンをクリックします。最初に環境を始動するときにIBM Cloud Privateが完全に開始されるまでには10〜15分かかります。
![環境の開始](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/startenv.png)
1. ブラウザからのアクセス
ほとんどの機能については、ブラウザからICPコンソールを起動できます。ブラウザからICPコンソールにアクセスするためのURLは確認メールで送信されます。
1. Linuxデスクトップ
Kubernetes CLIベースのクエリや他の機能にアクセスする必要がある場合は、ICPMasterノードをクリックします。
ICPMasterノードのLinuxデスクトップを開きます。

このLinuxデスクトップの中から、ICPにアクセスすることができます。
- コンソール：Firefoxブラウザを開き、IBMCloudPrivateConsoleブックマークをクリックします。ユーザーIDはadmin、パスワードはicp1nCl0udです。
- CommandLine：ターミナルウィンドウを開き、tools / kubcli.sh <userid> <password>を実行します。その後、kubectlコマンドの実行を開始することができます
  
  ![ICPMasterノード](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/icpmaster.png)
