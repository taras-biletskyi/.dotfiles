local schemas = {}
local strimzi_schemas = {
	{ name = "Kafka", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafka_v1beta2.json"},
	{ name = "KafkaBridge", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkabridge_v1beta2.json"},
	{ name = "KafkaConnector", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json"},
	{ name = "KafkaConnect_v1beta2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnect_v1beta2.json"},
	{ name = "KafkaMirrorMaker", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json"},
	{ name = "KafkaNodePool", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkanodepool_v1beta2.json"},
	{ name = "KafkaMirrorMaker2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json"},
	{ name = "KafkaRebalance", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkarebalance_v1beta2.json"},
	{ name = "KafkaTopic_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1alpha1.json"},
	{ name = "KafkaTopic_v1beta1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1beta1.json"},
	{ name = "KafkaTopic_v1beta2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1beta2.json"},
	{ name = "KafkaTopicControlsACLs_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopiccontrolacls_v1alpha1.json"},
	{ name = "KafkaTopicControlsACLs_v1beta1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopiccontrolacls_v1beta1.json"},
	{ name = "KafkaUser_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1alpha1.json"},
	{ name = "KafkaUser_v1beta1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1beta1.json"},
	{ name = "KafkaUser_v1beta2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1beta2.json"},
	{ name = "StrimziPodSet", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/strimzipodset_v1beta2.json"},
}

for _, schema in ipairs(strimzi_schemas) do
	table.insert(schemas, {
		name = "kafka.strimzi.io - " .. schema.name,
		uri = schema.uri,
	})
end

local k8s_core_schemas = {
	-- Core/v1
	{name = "Pod (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/pod-v1.json"},
	{name = "Service (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/service-v1.json"},
	{name = "ConfigMap (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/configmap-v1.json"},
	{name = "Secret (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/secret-v1.json"},
	{name = "PersistentVolumeClaim (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/persistentvolumeclaim-v1.json"},
	{name = "Namespace (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/namespace-v1.json"},
	{name = "ServiceAccount (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/serviceaccount-v1.json"},
	{name = "Node (v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/node-v1.json", },
	-- Apps/v1
	{name = "Deployment (apps/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/deployment-apps-v1.json"},
	{name = "StatefulSet (apps/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/statefulset-apps-v1.json"},
	{name = "DaemonSet (apps/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/daemonset-apps-v1.json"},
	{name = "ReplicaSet (apps/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/replicaset-apps-v1.json"},
	-- Batch/v1
	{name = "Job (batch/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/job-batch-v1.json"},
	{name = "CronJob (batch/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/cronjob-batch-v1.json"},
	-- Networking.k8s.io/v1
	{name = "Ingress (networking.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/ingress-networking-v1.json"},
	{name = "NetworkPolicy (networking.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/networkpolicy-networking-v1.json"},
	-- RBAC.authorization.k8s.io/v1
	{name = "Role (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/role-rbac-authorization-k8s-io-v1.json"},
	{name = "ClusterRole (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/clusterrole-rbac-authorization-k8s-io-v1.json"},
	{name = "RoleBinding (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/rolebinding-rbac-authorization-k8s-io-v1.json"},
	{name = "ClusterRoleBinding (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/clusterrolebinding-rbac-authorization-k8s-io-v1.json"},
	-- Storage.k8s.io/v1
	{name = "StorageClass (storage.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/storageclass-storage-k8s-io-v1.json"},
	{name = "VolumeAttachment (storage.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/volumeattachment-storage-k8s-io-v1.json"},
	-- Autoscaling/v1
	{name = "HorizontalPodAutoscaler (autoscaling/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/horizontalpodautoscaler-autoscaling-v1.json"},
	-- Policy/v1
	{name = "PodDisruptionBudget (policy/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/poddisruptionbudget-policy-v1.json"},
	-- Coordination.k8s.io/v1
	{name = "Lease (coordination.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/lease-coordination-k8s-io-v1.json"},
	-- Scheduling.k8s.io/v1
	{name = "PriorityClass (scheduling.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/priorityclass-scheduling-k8s-io-v1.json"},
}

-- Insert k8s schemas alongside your existing Strimzi schemas:
for _, schema in ipairs(k8s_core_schemas) do
	table.insert(schemas, {
		name = "k8s - " .. schema.name,
		uri = schema.uri,
	})
end

local prometheus_schemas = {
	{ name = "alertmanager_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/alertmanager_v1.json"},
	{ name = "alertmanagerconfig_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/alertmanagerconfig_v1alpha1.json"},
	{ name = "podmonitor_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/podmonitor_v1.json"},
	{ name = "probe_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/probe_v1.json"},
	{ name = "prometheus_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheus_v1.json"},
	{ name = "prometheusagent_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheusagent_v1alpha1.json"},
	{ name = "prometheusrule_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheusrule_v1.json"},
	{ name = "scrapeconfig_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/scrapeconfig_v1alpha1.json"},
	{ name = "servicemonitor_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/servicemonitor_v1.json"},
	{ name = "thanosruler_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/thanosruler_v1.json"},
}

for _, schema in ipairs(prometheus_schemas) do
	table.insert(schemas, {
		name = "Prometheus - " .. schema.name,
		uri = schema.uri,
	})
end

local cfg = require("yaml-companion").setup({
	schemas = schemas,
})

require("lspconfig")["yamlls"].setup(cfg)

-- Get the schema name for the current buffer 👇
local function get_current_yaml_schema()
	local schema = require("yaml-companion").get_buf_schema(0)
	if schema then
		return print(schema.result[1].name)
	end
	return ""
end

vim.keymap.set("n", "tyc", get_current_yaml_schema, { noremap = true })
vim.keymap.set("n", "tys", ":Telescope yaml_schema <CR>", { noremap = true })
