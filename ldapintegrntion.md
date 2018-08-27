# LDAPとの統合
この環境には、OpenLdapサーバがすでにデプロイされおり、LDAP認証を提供するために使用されます。 ICPを導入した段階では、ユーザーとグループは、ほとんど定義されていません（superuserである adminのみです）。
このシナリオでは、LDAPサーバーをICPに接続し、LDAPサーバーのユーザー/グループを追加して役割ベースのアクセスを実現します。 LDAPサーバーのサンプル・ユーザーとグループは、次のとおりです。
￼
<source srcset="https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ldapgroupsandusers.webp" type="image/webp">
<source srcset="http://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ldapgroupsandusers.png" type="image/png"> 
<img src="https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ldapgroupsandusers.png" alt="LDAPGroups&Users" >
上記のすべてのユーザーのパスワードはicp1nCl0udです。

## ICPとLDAPサーバーを統合する
LDAPサーバーとICPを統合するためには、LDAPサーバーのアドレス、ベースドメイン、バインド・ユーザーID、バインド・ユーザーパスワード、ユーザーとグループのフィルターが必要です。
1. kubectlを実行できるコマンド・ウィンドウを起動します。
1. コマンド *kubectl -n services svc |grep myopenldap* を実行して、ClusterIP をメモします(以下の例では 10.1.0.248です）。<br>
    `kubectl -n services get svc | grep myopenldap` <br>
    `myopenldap ClusterIP 10.1.0.248 <none> 389 / TCP、636 / TCP 1h`

1. 同様に、以下のコマンドを実行し、LDAP管理者のパスワードを書き留めておきます。<br>
    `kubectl get secret --namespace services myopenldap -o jsonpath="{.data.LDAP_ADMIN_PASSWORD}" | base64 --decode;echo`<br>
    `Si6O0hwBobyOoVBKoMnszIMedKRye39w`

1. 以下の情報を使用して、LDAPサーバーとICPクラスターを統合します。
    ICPコンソールのナビゲーション・メニュー -> 管理 ->認証 と開き、LDAP接続を追加します。

    |項目名|設定値|
    |:--:|:--|
    |Name|Openldap|
    |Type|Custom|
    |Base DN|dc=bluedemos,dc=com|
    |Bind DN|cn=admin,dc=bluedemos,dc=com|
    |Adminパスワード|Si6O0hwBobyOoVBKoMnszIMedKRye39w|
    |URL|ldap://10.1.0.248:389|

        ![LDAP設定画面](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ldap-connection-test.png)

1. [接続テスト]ボタンをクリックします。接続が正しい場合は、LDAP接続が成功したというメッセージが表示されます。
1. 同様に、グループとユーザーのフィルタとグループとユーザーのマッピングには次の値を使用します 
  
    |項目名|設定値|
    |:--:|:--|
    |グループ・フィルタ|(&(cn=％v)(objectclass=groupOfUniqueNames))|
    |ユーザ・フィルタ|(&(cn =％v)(objectclass=inetOrgPerson))
    |グループIDマップ|*：cn|
    |ユーザーIDマップ|*：cn|
    |グループ・メンバーIDマップ|groupOfUniqueNames:uniqueMember|


## ユーザーロール
ICPはさまざまな役割をサポートしています。ユーザーに関連付けられたロールは、実行できるアクションを決定します。様々な役割があった
`クラスタ管理者、管理者、オペレータ、エディタ、ビューアー`
各ロールの詳細については、[IBM KnowledgeCenter:役割ベースのアクセス制御](https://www.ibm.com/support/knowledgecenter/ja/SSBS6K_2.1.0.3/user_management/assign_role.html) を参照してください。

## チームを作成して、LDAPのユーザーおよびグループと関連付ける
ICP内でのユーザー管理の単位は*チーム*と呼ばれます。チーム内のすべてのユーザーは、チームに関連付けられたリソースにアクセスできます。
ユーザー、ユーザーグループ、リソースを複数のチームに関連付けることができます。次の手順を実行してチームを作成します。
1. ユーザーadminとしてICPコンソールにログインする 
1. ナビゲーション・メニュー ->管理 ->チームを開きます。
        ![チーム管理画面](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/team-menu.png)
1. チームに名前を与えます
        `blueadmins`
1. 検索フィールドで `admin` で検索を行います。マッチしたグループがLDAPからリストされます。icpadminsを選択します
        ![グループの選択](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/create-team.png)
1. グループが選択されると、グループと関連付ける役割の選択が表示されます。Administrator をリストから選びます。
1. 同様に その他のグループを追加し、役割を割り当てます。
        ![グループの割当](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/groups-to-add.png)
1. 追加されたグループを確認します
        ![グループの確認](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/groups-added.png)

## チームにリソースを追加する
チームにリソースを追加する必要があります。チームメンバーは、チームに追加されたリソースだけにアクセスできます。
1.ユーザーadminとして、ICPコンソールにログインする
1. ナビゲーション ・メニュー ->管理 ->チーム と開き、チーム blueadminsをクリックしてください
1. [リソース]タブをクリックします。
1. [リソースを追加]ボタンをクリックします。
1. デフォルトのリソース、googlestable、ibm-charts、ibm-charts-public、local-charts、stocktrader、weaveを選択し、「追加」ボタンをクリックします。
        ![リソースの追加](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/resources-toadd.png)    
1.リソースとリソースタイプは次のように表示されます
        ![リソースの確認](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/resources-added.png)

## 新規ユーザーでテストする
これで、追加されたユーザーとのログインがテストできるようになりました。

1. ユーザーicpadmin1としてログインします（パスワードicp1nCl0ud)
1. このユーザーに関連付けられたリソースを確認します。
1. このユーザーは管理者の役割を持つので、ユーザーは以下を実施することが可能です
    -チームの作成
    -他のチームにリソースを割り当てる
    -チームのためのリソースを作成する
    -チームのユーザー、グループ、ロールを管理する
    -チームのリソースの読み取り、更新、および削除
1. 他のロールも同様にテストします。
