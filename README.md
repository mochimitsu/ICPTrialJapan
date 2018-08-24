IBM Cloud Privateは、コンテナ化アプリケーションの開発、編成、および管理を行うためのアプリケーション・プラットフォームです。
このチュートリアルでは、IBM Cloud Private重要な機能について説明します。

# IBM Cloudプライベートの概要
IBM Cloud Private（ICP）は、コンテナ化されたアプリケーションの開発、編成、および管理を行うためのアプリケーション・プラットフォームです。 
ICP トライアル版をホストすることで、kubernetesの概念、クラウドネイティブアプリケーションの展開と管理を開始するのに役立ちます。
ICPは Kubernetesのアプリケーション開発の選択肢をサポートしています。以下の利点があります。
* マイクロテナントコンテナとマイクロサービスベースのアプリケーションを作成するためのKubernetesに基づくオーケストレーション
* 開発者の生産性を高めるエンタープライズとオープンなサービスの共通カタログ
* Istio、Prometheusによる監視、ELKによるロギングなど、マイクロサービスのスケーラブルな管理をサポートする共通の基本サービス
* アプリケーションの自動水平および無停止の垂直スケーリング
* アプリケーションの隔離とセキュリティのためのネットワークとクラウドストレージポリシーベースのコントロール
* 自動化されたアプリケーション健全性チェックと障害からの回復

# 環境の予約
[ホスティッドICPトライアル環境](https://www.ibm.com/cloud/garage/tutorials/ibm-cloud-private-trial/ibm-cloud-private-hosted-trial)
のページから、環境の予約を行ってください。最大１週間まで利用することが可能です。

# 環境へのアクセス
**重要：2時間の休止後、環境はサスペンドされます。作業を再開するには、右上隅の再生アイコンをクリックします。再起動処理には10〜15分かかります。**

1. 予約フォームを完了して数分後、予約した環境に関する指示が記載された電子メールを受信トレイで確認してください。指示に従って、インスタンスにログインします。
1. 初めて自分の環境にログインすると、VMがサスペンドされていることもあります。開始するには、右上隅の再生アイコンをクリックします。最初に環境を始動するときにIBM Cloud Privateが完全に開始されるまでには10〜15分かかります。
1. ブラウザからのアクセス：ほとんどの機能については、ブラウザからICPコンソールを起動できます。ブラウザからICPコンソールにアクセスするためのURLは確認メールで送信されます。
1. Linuxデスクトップ：Kubernetes 	cliベースのクエリや他の機能にアクセスする必要がある場合は、ICPMasterノードをクリックします。これは、ICPMasterノードのLinuxデスクトップを開きます。
このデスクトップの中から、ICPにアクセスすることができます。
コンソール：Firefoxブラウザを開き、IBMCloudPrivateConsoleブックマークをクリックします。ユーザーIDはadmin、パスワードはicp1nCl0udです。
CommandLine：ターミナルウィンドウを開き、tools / kubcli.sh <userid> <password>を実行します。その後、kubectlコマンドの実行を開始することができます

# チュートリアル・コンテンツ
## [トライアル環境の詳細](https://github.com/ICpTrial/ICPTrialJapan/blob/master/environemnt.md)
## [Mircoclimate](https://github.com/ICpTrial/ICPTrialJapan/blob/master/microclimate.md)
## [サンプルマイクロサービスアプリケーション](https://github.com/ICpTrial/ICPTrialJapan/blob/master/samplemicroservice.md)
## [LDAPとの統合](https://github.com/ICpTrial/ICPTrialJapan/blob/master/ldapintegrntion.md)
## [モニタリング](https://github.com/ICpTrial/ICPTrialJapan/blob/master/monitoring.md)
## [ロギング](https://github.com/ICpTrial/ICPTrialJapan/blob/master/logging.md)
## [Istio](https://github.com/ICpTrial/ICPTrialJapan/blob/master/istio.md)
## [Kubernetes操作ビュー](https://github.com/ICpTrial/ICPTrialJapan/blob/master/opertionalview)
## [ウィーブスコープ](https://github.com/ICpTrial/ICPTrialJapan/blob/master/weavescope.md)
## [Linuxネットアプリケーションのサンプル](https://github.com/ICpTrial/ICPTrialJapan/blob/master/dotnetapplication.md)
## [ICP コミュニティ・サポート](https://github.com/ICpTrial/ICPTrialJapan/blob/master/communitysupport.md)
## [まとめ](https://github.com/ICpTrial/ICPTrialJapan/blob/master/summary.md)
