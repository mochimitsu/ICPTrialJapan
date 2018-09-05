# モニタリング
ICPクラスタ監視ダッシュボードを使用して、ICPクラスタとアプリケーションのステータスを監視できます。
監視ダッシュボードでは、PrometheusとGrafanaを使用して、クラスタノードとコンテナに関する詳細なデータを表示します。
これらの監視コンポーネントは、（明示的に無効化しない限り）ICP導入時に自動的に導入・構成されます。


## Prometheus
![PromethuesLogo](https://www.cncf.io/wp-content/uploads/2018/02/prometheus-stacked-color.png) <br>
Prometheus は、元々SoundCloudで構築されたオープンソースのシステム監視とアラート・ツールキットです。プロメテウスは、2016年にCNCFに、Kubernetesにつづく2のホストプロジェクトとして加わりました。ほとんどのPrometheusコンポーネントはGoで書かれており、静的なバイナリとして簡単にビルドおよびデプロイできます。

プロメテウスは、以下のコンポーネントから構成されます。
1. **プロメテウスサーバー** はターゲットを監視します。ターゲットはHTTP、HTTPS、DNS、TCP、ICMP（*Black-Box Exporter）経由の任意のエンドポイントであるか、またはプロメテウスのサーバーがアプリケーションの状態を取得するアプリケーションが公開する単純なHTTPエンドポイントです。
特定のターゲットからのメトリックを収集し、atime-seriesデータベースに格納するために定義した間隔で、Prometheusサーバーのクラスターゲットを作成し、PromQLというクエリ言語を使用してターゲットに関するメトリックをクエリ(問合せ)します。
1. **Alert Manager** はアラートを取り込み、それらをグループに集約し、重複排除し、無音を適用し、スロットルし、電子メール、Pagerduty、Slackなどに通知を送信します。
1. **Exporter**は、サードパーティのシステムから既存のメトリックを取得し、Prometheusサーバーが理解できるメトリック形式にエクスポートするソフトウェアです。
![Prometheus Architecture](https://prometheus.io/assets/architecture-cb2ada1ece6.png)

## Grafana
1. Grafanaは、Prometheusデータベースに格納されているメトリックを視覚化する視覚化レイヤーです。
Prometheusサーバーに直接PromQLクエリを書く代わりに、Grafana UIボードを使用してPrometheusサーバーからメトリックをクエリし、Grafana Dashboardで視覚化することができます。ダッシュボードにアクセスするには、ブラウザで新しいタブを開き、Grafanaのブックマークをクリックします

以下のGrafana ダッシュボードは製品導入時にデプロイされています。
- Docker Host & Container Overview 
- ElasticSearc
- Etcd by Prometheus 
- ICP 2.1 Namespaces Performance IBM Provided 2.5 
- ICP 2.1 Performance IBM Provided 2.5 
- Kubernetes cluster monitoring(via Prometheus) 
- Prometheus stats
