
# Cloud Automation Manager

## 製品版CAM導入手順
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
  |*-----*|-----|
  |リリース名| 任意の名前 |
  |ターゲット名前空間| sevices |
  |使用条件への同意| ライセンスを確認して同意してください |
  
  グローバル
  |パラメータ名前|設定値|
  |*-----*|-----|
  |Image pull secret name| 任 |
  |Deploy API key| |
  
1. HELMのデプロイが完了するのを待ちます

## クラウド接続の定義
1. CAMコンソールを Manage > Cloud Connections と開き、
  
  
