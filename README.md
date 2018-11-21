# Simple Elastic + Kibana Demo on DCOS

Below are instructions for setting up a simple Elastic + Kibana demo on DCOS

## Prerequisites

- DC/OS 1.12 EE
- X Masters
- Y Agents



## Setup DC/OS cluster

Connect to your cluster using `dcos cluster setup` like so:

```
dcos cluster setup https://<MASTER_NODE_IP_OR_ELB_ADDRESS>
```

## Install DC/OS enterprise CLI

If you don't already have the enterprise cli installed, do so.

```
dcos package install dcos-enterprise-cli --yes
```

## Install Elastic

```
dcos package install elastic --yes
```

### Load Elastic with sample data

First, SSH into your master node. This is where we will pull down our data and load it into Elastic.

```
dcos node ssh --master-proxy --leader
```

Next, we will pull down the sample data we will use. 

NB: This is a simple dataset of US spending on hospital care by state from 1991-2014. This dataset was selected because it's a universally understandable metric and lends itself to both geographical and time series visualizations.

```
TODO
```





## Install Kibana

### Prepare Kibana config file

Save the JSON blob below as `kibana-config.json` to pass as options when we install Kibana.

```
{
    "service": {
        "name": "kibana"
    },
    "kibana": {
        "elasticsearch_url": "http://coordinator.elastic.l4lb.thisdcos.directory:9200/",
        "xpack_enabled": false
    }
}
```

### Install Kibana on DC/OS

Then, run the below command to install Kibana on the cluster:

```
dcos package install kibana  --yes --options=kibana-config.json
```





