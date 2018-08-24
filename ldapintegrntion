# LDAPとの統合
Openldapサーバは環境に配備され、LDAP認証を提供するために使用されます。 ldapサーバーには、サンプルユーザーとグループがほとんどありませんでした。このシナリオでは、ldapサーバーをICPに接続し、ldapサーバーのユーザー/グループを追加して役割ベースのアクセスを実現します。 LDAPサーバーのサンプルユーザーとグループは、次のとおりです。
￼
 <source srcset = "https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ldapgroupsandusers.webp" type = "image / webp"> <source srcset = "https：// ibm- dte.mybluemix.net/images/tutorials/cloud-private-trial/ldapgroupsandusers.png "type =" image / png "> <img src =" https://ibm-dte.mybluemix.net/images/tutorials/cloud -private-trial / ldapgroupsandusers.png "alt =" LDAPGroups＆amp; Users ">
上記のすべてのユーザーのパスワードはicp1nCl0udです。

## ICPとLDAPサーバーを接続する
1. ldapサーバーとICPを接続するには、LDAPサーバーのアドレス、ベースドメイン、バインドユーザーID、バインドユーザーパスワード、ユーザーとグループのフィルターが必要です。
1. kubectlを実行できるコマンドウィンドウを起動します。
1. コマンドkubectl -n services svcを実行します。 grep myopenldapを実行して、ClusterIP 10.1.0.248kubectl -n services get svc | grep myopenldap
* myopenldap ClusterIP 10.1.0.248 <なし> 389 / TCP、636 / TCP 1h
*
1. 同様に、以下のようにコマンドを実行し、LDAP管理者のパスワードを書き留めておきます。kubectl get secret --namespace services myopenldap -o jsonpath = "{。data.LDAP_ADMIN_PASSWORD}" | base64  - デコード;エコー
* Si6O0hwBobyOoVBKoMnszIMedKRye39w
*
1. 以下の情報を使用して、ldapサーバーとICPクラスターを接続します。 ICPコンソールのナビゲーションメニュー - >管理 - >認証、LDAP接続を追加します。名前：OpenldapType：CustomBase DN：dc = bluedemos、dc = comBind DN：cn = admin、dc = bluedemos、dc = comAdminパスワード：Si6O0hwBobyOoVBKoMnszIMedKRye39wURL：ldap：//10.1.0.248：389
1. [接続テスト]ボタンをクリックします。接続が正しい場合は、LDAP接続が成功したというメッセージが表示されます。
1. 同様に、グループとユーザーのフィルタとグループとユーザーのマッピングには次の値を使用します
グループフィルタ：（＆（cn =％v）（objectclass = groupOfUniqueNames））ユーザフィルタ：（＆（cn =％v）（objectclass = inetOrgPerson））グループIDマップ：*：cnユーザIDマップ：*：cnグループメンバーIDマップ：groupOfUniqueNames：uniqueMember

## ユーザーロール
ICPはさまざまな役割をサポートしています。ユーザーに関連付けられたロールは、実行できるアクションを決定します。様々な役割があった
クラスタ管理者、管理者、オペレータ、エディタ、icpviewer
各ロールの詳細については、IBM Knowledgecenterを参照してください。

## グループを作成してLDAPでグループに関連付ける
チーム内のすべてのユーザーは、チームに関連付けられたリソースにアクセスできます。ユーザー、ユーザーグループ、リソースを複数のチームに関連付けることができます。次の手順を実行してチームを作成します。
1. ユーザーadminとしてICPコンソールにログインする
ナビゲーションメニュー - >管理 - >チーム

## チームにリソースを追加する
チームにリソースを追加する必要があります。チームメンバーは、チームに追加されたリソースだけにアクセスできます。
ユーザーadminとしてICPコンソールにログインする
ナビゲーションメニュー - >管理 - >チーム
team blueadminsをクリックしてください
[リソース]タブをクリックします。
[リソースを追加]ボタンをクリックします。
デフォルトのリソース、googlestable、ibm-charts、ibm-charts-public、local-charts、stocktrader、weaveを選択し、「追加」ボタンをクリックします。
リソースとリソースタイプは次のように表示されます

## 新規ユーザーでテストする
これで、追加されたユーザーとのログインがテストされます。
パスワードicp1nCl0udのユーザーicpadmin1としてログインする
このユーザーに関連付けられたリソースを確認します。
このユーザーは管理者の役割を持つので、ユーザーは
チームの作成
他のチームにリソースを割り当てる
チームのためのリソースを作成する
チームのユーザー、グループ、ロールを管理する
チームのリソースの読み取り、更新、および削除
他のロールと同様にテストします。
