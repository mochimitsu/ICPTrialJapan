
# Cloud Automation Manager

## 製品版CAM導入手順
1. CAMのシステム要求を確認します。ICPのシステム要求に加えて追加で必要になります（コア数、メモリ、ストレージ）<br>
　 [CAM System Requirement](https://www.ibm.com/support/knowledgecenter/en/SS2L37_2.1.0.3/cam_requirements.html)
   
1. (2.1.0.3環境のみ) [暫定修正適用](https://www.ibm.com/support/knowledgecenter/en/SS2L37_2.1.0.3/cam_prereq.html)

1. ICPコマンド環境 および dockerレジストリへのログイン<br>
  *bx pr login -a https://mycluster.icp:8443 --skip-ssl-validation*
  *docker login mycluster.icp:8500*
    
1. HELMカタログへの製品イメージの登録<br>
  *bx pr load-ppa-archive --archive icp-cam-x86_64-2.1.0.3_06-27.tar.gz --clustername mycluster.icp --namespace services
  
1. HELMカタログの同期<br>
  ICPコンソールから「管理」> 「リポジトリー」を開き、「リポジトリーの同期」をクリックします。

1. HELMカタログの確認
  HELMカタログを開き、検索バーで cam を検索し、*local-repo* として、 *ibm-cam* が登録されていることを確認します。
  
  
## CAM導入事前準備
1. CAMの導入の前提となる PersistentVolume を４つ作成します。
  cam-mongo-pv
  cam-logs-pv
  cam-terraform-pv
  cam-bpd-appdata-pv
 
 
1. HELMカタログにおいて、導入HELMチャートの選択
  製品版をデプロイする場合は *local-repo* の ibm-cam V 1.3.1 を選択し、「構成」ボタンを押します。
  トライアル版を利用する場合には *ibm-repo*の ibm-cam V1.3.1 を選択します、「構成」ボタンを押します。
  
1. HELM構成パラメータの指定

  構成
  

  |パラメータ名前|設定値|
  |:-----:|:-----|
  |リリース名| 任意の名前 |
  |ターゲット名前空間| sevices |
  |使用条件への同意| ライセンスを確認して同意してください |
  
  グローバル
  
  |パラメータ名前|設定値|
  |:-----:|:-----|
  |Image pull secret name| 任 |
  |Deploy API key| |
  
1. HELMのデプロイが完了するのを待ちます

## クラウド接続の定義（AWSを例に）
1. CAMコンソールを Manage > Cloud Connections と開きます
1. Create Connections をクリックします
   1. Cloud Provider に Amazon EC2 を選択します（ここで選択した値により、詳細設定項目は変わります）
   1. Cloud Connection に任意の名前を付けます<br>
   このあと設定する AccessID を鑑み、どの用途の環境か分かるようにしておくといいです
   1. Description に 任意の備考を記載します (テスト用など）
   1. AWS の 接続情報を設定します （Access Key ID, Secret Access Key)
   1. リージョンには Asia Pacific (Tokyo) Region をハンズオンでは選びます
 
## カスタム・テンプレートの作成（ソースコード CAMローカル管理）
1. CAMコンソールから Library > Template を選択します
1. Create Template をクリックします
   1. From Scratch を選択します
   1. 設定として、以下を記載します（任意にカスタマイズして頂いてかまいません）
   
     |パラメータ名前|設定値|
     |:-----:|:-----|
     |Name|AWS-SimpleVM-Scratch|
     |Description|AWS上にシンプルなVM環境を払出します。TerraformコードをCAM上で管理します|
     |Cloud Provider|AWS EC2|
1. Template Metadata を以下のように記載します
   
  
  
