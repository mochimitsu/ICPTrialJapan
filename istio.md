
# Istio
![IstioLogo](https://github.com/ICpTrial/ICPTrialJapan/tree/master/pictures/istio.png)

IBM、Google、Lyftの共同作業であるIstioは、マイクロサービス自体を変更することなく、複雑なタスクの多くを自動的に管理するサービスメッシュを簡単に作成する方法を提供します。 Istioは、以下の機能を提供します。

- ネットワーク・インフラストラクチャー全体を管理し、devopsチームによって定義されたポリシーおよびトラフィック・ルールを適用するコントロール・プレーンをデプロイする
-「サイドカー」を含むデータ・プレーンを配置する。マイクロ・サービスの各インスタンスの側面に沿って配置され、すべての着信および発信ネットワーク・トラフィックを傍受するためのプロキシとして機能するセカンダリ・コンテナ。サイドカーは、オープンソースのエッジプロキシであるEnvoyを使用して実装されています。

この環境では、bookinfoサンプルが事前にデプロイされています。サンプルアプリケーションbookinfoは、Istio-Bookinfoサンプルブックマークをクリックするとアクセスできます
詳細は [Traffic Management for Your Microservices](https://github.com/IBM/microservices-traffic-management-using-istio)で確認できます。
