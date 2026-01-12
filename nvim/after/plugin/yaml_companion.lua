local schemas = {}
local base = "file:///home/taras/work/strimzi_schemas/strimzi"
local strimzi_schemas = {
	{ name = "Kafka_v1", uri = base .. "/kafkas.kafka.strimzi.io/v1.json" },
	{ name = "KafkaBridge_v1", uri = base .. "/kafkabridges.kafka.strimzi.io/v1.json" },
	{ name = "KafkaConnect_v1", uri = base .. "/kafkaconnects.kafka.strimzi.io/v1.json" },
	{ name = "KafkaConnector_v1", uri = base .. "/kafkaconnectors.kafka.strimzi.io/v1.json" },
	{ name = "KafkaMirrorMaker_v1", uri = base .. "/kafkamirrormakers.kafka.strimzi.io/v1.json" },
	{ name = "KafkaMirrorMaker2_v1", uri = base .. "/kafkamirrormaker2s.kafka.strimzi.io/v1.json" },
	{ name = "KafkaNodePool_v1", uri = base .. "/kafkanodepools.kafka.strimzi.io/v1.json" },
	{ name = "KafkaRebalance_v1", uri = base .. "/kafkarebalances.kafka.strimzi.io/v1.json" },
	{ name = "KafkaTopic_v1", uri = base .. "/kafkatopics.kafka.strimzi.io/v1.json" },
	{ name = "KafkaUser_v1", uri = base .. "/kafkausers.kafka.strimzi.io/v1.json" },
	{ name = "StrimziPodSet_v1", uri = base .. "/strimzipodsets.core.strimzi.io/v1.json" },
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
	{name = "Role (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/role-rbac-v1.json"},
	{name = "ClusterRole (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/clusterrole-rbac-v1.json"},
	{name = "RoleBinding (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/rolebinding-rbac-v1.json"},
	{name = "ClusterRoleBinding (rbac.authorization.k8s.io/v1)", uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.7-standalone-strict/clusterrolebinding-rbac-v1.json"},
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

local kustomize_schemas = {
	{ name = "kustomize_v1beta1", uri = "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/kustomization.json"},
}

for _, schema in ipairs(kustomize_schemas) do
	table.insert(schemas, {
		name = "Kustomize - " .. schema.name,
		uri = schema.uri,
	})
end

local olm_schemas = {
	{name = "catalogsource_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/catalogsource_v1alpha1.json"},
	{name = "clusterserviceversion_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/clusterserviceversion_v1alpha1.json"},
	{name = "installplan_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/installplan_v1alpha1.json"},
	{name = "olmconfig_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/olmconfig_v1.json"},
	{name = "operator_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/operator_v1.json"},
	{name = "operatorcondition_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/operatorcondition_v1.json"},
	{name = "operatorcondition_v2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/operatorcondition_v2.json"},
	{name = "operatorgroup_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/operatorgroup_v1.json"},
	{name = "operatorgroup_v1alpha2", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/operatorgroup_v1alpha2.json"},
	{name = "subscription_v1alpha1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/operators.coreos.com/subscription_v1alpha1.json"},
}

for _, schema in ipairs(olm_schemas) do
	table.insert(schemas, {
		name = "OLM - " .. schema.name,
		uri = schema.uri,
	})
end

local cert_manager_schemas = {
	{name = "certificate_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/cert-manager.io/certificate_v1.json"},
	{name = "certificaterequest_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/cert-manager.io/certificaterequest_v1.json"},
	{name = "clusterissuer_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/cert-manager.io/clusterissuer_v1.json"},
	{name = "issuer_v1", uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/cert-manager.io/issuer_v1.json"},
}

for _, schema in ipairs(cert_manager_schemas) do
	table.insert(schemas, {
		name = "Cert-manager - " .. schema.name,
		uri = schema.uri,
	})
end

local cfg = require("yaml-companion").setup({
	builtin_matchers = {
		kubernetes = { enabled = false },
		cloud_init = { enabled = false },
	},

	-- my custom schemas
	schemas = schemas,

	lspconfig = {
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				validate = true,
				format = { enable = false },
				hover = true,
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
				schemaDownload = { enable = true },
				schemas = {},
				-- trace = { server = "debug" },
			},
		},
	},
})

vim.lsp.config("yamlls", cfg)
vim.lsp.enable("yamlls")

local function get_schema_name()
	local ok, yc = pcall(require, "yaml-companion")
	if not ok then
		vim.notify("yaml-companion not loaded", vim.log.levels.WARN)
		return
	end

	local schema = yc.get_buf_schema(0)
	local name = schema and schema.result and schema.result[1] and schema.result[1].name

	if not name or name == "none" then
		vim.notify("Current YAML schema: none", vim.log.levels.INFO)
		return
	end

	vim.notify("Current YAML schema: " .. name, vim.log.levels.INFO)
end

vim.keymap.set("n", "tyc", get_schema_name, { noremap = true, silent = true, desc = "Show current YAML schema" })

-- Requires
-- 1. `nvim-telescope/telescope-ui-select.nvim` plugin:
-- {
-- 	"nvim-telescope/telescope-ui-select.nvim",
-- 	dependencies = { "nvim-telescope/telescope.nvim" },
-- },
-- 2. Telescope setup:
-- require("telescope").setup({
-- 	extensions = {
-- 		["ui-select"] = require("telescope.themes").get_dropdown({}),
-- 	},
-- })
-- require("telescope").load_extension("ui-select")
vim.keymap.set("n", "tys", function()
	require("yaml-companion").open_ui_select()
end, { noremap = true, silent = true, desc = "Pick YAML schema (Telescope)" })

vim.keymap.set("n", "tyq", "<cmd>YamlKeys<CR>", { noremap = true, silent = true, desc = "All YAML keys into quickfix" })

vim.keymap.set("n", "tyd", function()
	require("yaml-companion").open_datree_crd_select()
end, { noremap = true, silent = true, desc = "Open Datree schemas" })
