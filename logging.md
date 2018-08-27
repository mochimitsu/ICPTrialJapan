# ロギング
![ELKLogo](https://landscape.cncf.io/logos/elastic.svg)
![
ICPロギングでは、ロギングにElastic Search、Logging、Kibana（ELK）スタックを使用します。事前インストールされたELKスタックは、KubernetesとDockerを含むICP管理サービスのシステムログを収集します。デフォルトのELKスタックとFilebeatデーモン・セットは、デプロイされているコンテナ・ログを収集します。
ICPでは、ユーザー・アプリケーション用のELKスタックをカタログから展開し、さらに多くのELKインスタンスを構成することができます。ICPでは展開されるELKスタックの数に制限はありません。

## ELKアーキテクチャ
![EKLOverview](https://www.elastic.co/guide/en/beats/libbeat/5.6/images/beats-platform.png)
![ELKArchitecure](https://ibm-dte.mybluemix.net/images/tutorials/cloud-private-trial/ELKArchitecture.png)


- **Elasticcsearch**は、ELKスタック上のインデックス、ストア、およびクエリアプリケーションです。Logstashで処理されるログファイルレコードの標準的な全文検索機能を提供します。 ELKオンライン・ヘルプ・ドキュメントでは、Elasticsearchについて次のように説明しています。「一般的に、複雑な検索機能と要件を持つアプリケーションに役立つ基本的なエンジン/テクノロジとして使用されています。
- **Logstash**は、ELKスタックがログファイル・レコードの収集、変換、および転送を管理できるようにするアプリケーションです。 Logstashは、リモートソースからレコードを取得したり、指定されたポート上のレコードをリスンすることができます。
- **Kibana** は、検索結果を視覚化し、検索に基づいてチャートやダッシュボードを作成できるように、エラーサーチと統合するユーザーインターフェイスです。検索、チャート、およびダッシュボードは、リアルタイムまたは履歴ログ記録を視覚化することができます。ロギングダッシュボードにアクセスするには、ブラウザで新しいタブを開き、「Kibana」ブックマークをクリックします
