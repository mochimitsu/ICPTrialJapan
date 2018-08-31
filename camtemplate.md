
## クラウド接続の定義（AWSを例に）
各クラウド・プロバイダーにアクセスするための定義情報を作成します。
同じクラウド・プロバイダーであっても、AccessKeyを変えることにより複数定義を持つことができます

1. CAMコンソールを Manage > Cloud Connections と開きます
1. Create Connections をクリックします
   1. Cloud Provider に Amazon EC2 を選択します（ここで選択した値により、詳細設定項目は変わります）
   1. Cloud Connection に任意の名前を付けます<br>
   このあと設定する AccessID を鑑み、どの用途の環境か分かるようにしておくといいです
   1. Description に 任意の備考を記載します (テスト用など）
   1. AWS の 接続情報を設定します （Access Key ID, Secret Access Key)
   1. リージョンには Asia Pacific (Tokyo) Region をハンズオンでは選びます
   
   
--------   
## カスタム・テンプレートの作成（ソースコード CAMローカル管理）
テンプレートでは、IaaSなどの払い出しな必要な情報を Terraform というコードに落とします。<br>
テンプレートを利用するユーザーは、主に技術者です。

1. CAMコンソールから Library > Template を選択します
1. Create Template をクリックします
   1. From Scratch を選択します
   1. 設定として、以下を記載します
   
     |パラメータ名前|設定値|
     |:-----:|:-----|
     |Name|AWS-SimpleVM-Scratch|
     |Description|AWS上にシンプルなVM環境を払出します。TerraformコードをCAM上で管理します（※任意にカスタマイズして頂いてかまいません）|
     |Cloud Provider|AWS EC2|
     <img src="https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/CreateTemplate.png" title="CreateTemplate" width="400">

    
1. Template Metadata を以下のように記載し、保存します。

     |パラメータ名前|設定値|
     |:-----:|:-----|
     |LongDescrption|テンプレートの詳細な説明を記載します|
     |Features|テンプレートにより構成される様々な機能を記載します（OSのバージョンやミドルウェアのバージョンなど）|

    ![TemplateMetadata](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/TemplateMetadata.png)
   
  
1. Manage Template タブを開きます 
    1. Edit Version タブで、*Add your template source code here* をクリックします。
    1. Display Name は V1.0.0 の ままで OKです（任意に変えて頂いても問題ありません）
    1. AWS用のサンプル・テンプレートとして、以下のURLを指定し、Uploadをクリックします。
    `https://raw.githubusercontent.com/ICpTrial/ICPTrialJapan/master/cam/template/aswsimple.tf`
    1. Terraformソース内の Subnet や SecurityGroup IDなどは 各自の環境にあわせて修正し、追加します。
        <img src="https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/TemplateSource.png" title="SampleTemplate" width="400">
    
    1. 一旦、右上の「Save]をクリックして、テンプレートを保存します。
    1. "Update Parameters" をクリックします。インポート・タイプとして"Template Parameter" を指定します。
    1. テンプレート内の環境変数が Parameter として読み込まれます。Updateをクリックします。
  
      ![UpdateParameter](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/UpdateParameter.png)
    
    1. 保存します。

## テンプレートを利用した払い出し
   1. Template のメニューから作成した "AWS-Simple-VM-Scratch" を選択します。
   1. 右下にある「Deploy Template」をクリックします。
   1. デプロイ先環境およびテンプレート・パラメータを指定します。ご用意頂いた AWSのテスト環境にあわせて、設定してください。
   
       |パラメータ|設定値|
       |:------:|:-------|
       |InstanceName|テンプレートで払い出されるシステム・インスタンスのCAM上の管理名を指定します|
       |CloudConnection|定義されたAWSのクラウド接続を選択します。複数作成した場合は適切なものを選んでください|
       |Aws_Subnet|サンプルではリストにしています。適切なSubnetのみを残して他を☓で消します|
       |InstanceType|払い出す EC2インスタンスのタイプを指定します t2.nano t2.micro t2.large など|
       |KeyPair_Name|任意のカギ名|
       |Public_SSHKey|インスタンスのSSHログインに利用する公開鍵( ssh-rsa AAAAXXXXX....)|
       |SecurityGroupID|払い出し先セキュリティ・グループ|
       |azs|Availability Zone|
   
   1. 「Deploy」をクリックします。インスタンスのデプロイが開始されますので、デプロイの状況を確認します。
       ![デプロイ中](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/deployment.png)
       ![デプロイ完了](https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/deploysuccess.png)
       
   1. デプロイに失敗した場合は「Log File」タブを確認し、Terraformが出力するメッセージを確認してください。
      パラメータの誤りであれば「Modify」タブをクリックして、Edit Parameters でパラメータを更新し、Applyし再度デプロイしてください。
   
## カスタム・テンプレートの作成（ソースコード GIT管理）
1. CAMコンソールから Library > Template を選択します
1. Create Template をクリックします
   1. GitHub を選択します
   1. GitHub Repository URL として https://github.com/ICpTrial/ICPTrialJapan/tree/master/cam/template を指定します
        <img src="https://github.com/ICpTrial/ICPTrialJapan/blob/master/cam/pics/templategit.png" title="TemplateGit" width="400">
   1. Templateが生成されますので、先と同様にカスタマイズしていきます。


引き続き、非技術者向けのユーザー・ビューである サービス を見ていきます。→ 
[CAMの利用2](https://github.com/ICpTrial/ICPTrialJapan/blob/master/camservice.md)
