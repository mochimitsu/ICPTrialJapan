
# Cloud Automation Manager

## 製品版CAM導入手順
1. CAMのシステム要求を確認します。[CAM System Requirement](https://www.ibm.com/support/knowledgecenter/en/SS2L37_2.1.0.3/cam_requirements.html) <br>
  ICPのシステム要求に加えて追加で必要になります（コア数、メモリ、ストレージ）
   
1. (2.1.0.3環境のみ) [暫定修正の適用](https://www.ibm.com/support/knowledgecenter/en/SS2L37_2.1.0.3/cam_prereq.html) <br>
  弊社 FixCentral から helm-api-apikeys-2.1.0.3-20180626-9425.sh をダウンロードして適用します。
1. ICPコマンド環境 および dockerレジストリへのログイン<br>
  *bx pr login -a https://mycluster.icp:8443 --skip-ssl-validation*
  *docker login mycluster.icp:8500*
    
1. HELMカタログへの製品イメージの登録<br>
  *bx pr load-ppa-archive --archive icp-cam-x86_64-2.1.0.3_06-27.tar.gz --clustername mycluster.icp --namespace services*
  
1. HELMカタログの同期<br>
  ICPコンソールから「管理」> 「リポジトリー」を開き、「リポジトリーの同期」をクリックします。

1. HELMカタログの確認
  HELMカタログを開き、検索バーで cam を検索し、*local-repo* として、 *ibm-cam* が登録されていることを確認します。
    
## CAM導入事前準備
1. CAMの導入の前提となる PersistentVolume を４つ作成します。

     |pv名|用途|
     |:-----:|:-----|
     |cam-mongo-pv|CAMのデータが配置されるPersitenceVolume|
     |cam-logs-pv|CAMのログが配置されるPersitenceVolume|
     |cam-terraform-pv|CAMのterraformの作業ディレクトリが配置されるPersitenceVolume|
     |cam-bpd-appdata-pv|GUIでのTerraformコード生成ツールのデータが配置されるPersitenceVolume|
   
  1. cam-mongo-pvの定義ファイル [cam-mongo-pv](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/cam-mongo-pv.yaml) を開き、内容をコピーします。ICPコンソールを開き、右上にある「リソースの作成」をクリックし、開いたウィザードに、それぞれのファイルの内容をペーストします。
NFSサーバーのIPアドレスとパスを書き換えて「作成」をクリックします。
  1. ICPコンソールから、プラットフォーム > ストレージ と開き、Persitence-Volume タブに cam-mongo-pv が available ステータスで作成されていることを確認します。
  1. 同様に、 cam-logs-pv, cam-terraform-pv, cam-bpd-appdata-pv の残りの３つのpvも作成します。  
      [cam-logs-pv](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/cam-logs-pv.yaml) ,
      [cam-terraform-pv](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/cam-terraform-pv.yaml) ,
      [cam-bpd-appdata-pv](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/cam-bpd-appdata-pv.yaml)
  
  1. kubectl create -f <xxxxx-pv.yaml> でも PersitenceVolumeを生成することが可能です

## Service ID API Key の生成
1. OSの Terminal を開き、 [Service ID API Keyの生成](https://www.ibm.com/support/knowledgecenter/en/SS2L37_2.1.0.3/cam_install_offline_EE.html) の手順で、Service ID API Keyを生成します。
 
## CAM導入 
1. HELMカタログにおいて、導入HELMチャートを選択します
     - 製品版をデプロイする場合は *local-repo* の ibm-cam V1.3.1 を選択し、「構成」ボタンを押します。
     - トライアル版を利用する場合には *ibm-repo*の ibm-cam V1.3.1 を選択し、「構成」ボタンを押します。
  
1. 導入時にHELM構成パラメータを指定します。指定されたもの以外は デフォルト値のままで問題ありません。

      構成

      |パラメータ名前|設定値|
      |:-----:|:-----|
      |リリース名|任意の名前|
      |ターゲット名前空間|Services|
      |使用条件への同意|ライセンスを確認して同意してください|

      グローバル

      |パラメータ名前|設定値|
      |:-----:|:-----|
      |Image pull secret name|default|
      |Product Identifier|既に指定されている場合にはデフォルトのままで問題ありません。指定されていない場合は、Product IDファイル（icp-cam-prod-id-2.1.0.3_06-27.txt）に記載されている内容をCOPY&PASTEします
      |Deploy API key|Service ID API Keyの手順で生成したKeyを指定します|
  
  1. HELMのデプロイが成功したことをを確認します。ICPコンソールから HELM リリースを開きます
  1. デプロイメント に含まれている CAMのマイクロサービスの各デプロイメントが Running ステータスとなっていることを確認します
  1. Running となっていないデプロイメントが存在する場合は、当該デプロイメントのリンクをクリックし開きます。
     各デプロイメントのページの下にある Pod のリンクを開き、Event および Logs を確認し、正常稼働の妨げになっている事象を確認します
 

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
   
  
  
