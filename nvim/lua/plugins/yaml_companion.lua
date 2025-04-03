local strimzi_schemas = {
	{
		name = "Kafka",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafka_v1beta2.json",
	},
	{
		name = "KafkaBridge",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkabridge_v1beta2.json",
	},
	{
		name = "KafkaConnector",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json",
	},
	{
		name = "KafkaConnect_v1beta2",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnect_v1beta2.json",
	},
	{
		name = "KafkaMirrorMaker",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json",
	},
	{
		name = "KafkaNodePool",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkanodepool_v1beta2.json",
	},
	{
		name = "KafkaMirrorMaker2",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkaconnector_v1beta2.json",
	},
	{
		name = "KafkaRebalance",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkarebalance_v1beta2.json",
	},
	{
		name = "KafkaTopic_v1alpha1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1alpha1.json",
	},
	{
		name = "KafkaTopic_v1beta1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1beta1.json",
	},
	{
		name = "KafkaTopic_v1beta2",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopic_v1beta2.json",
	},
	{
		name = "KafkaTopicControlsACLs_v1alpha1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopiccontrolacls_v1alpha1.json",
	},
	{
		name = "KafkaTopicControlsACLs_v1beta1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkatopiccontrolacls_v1beta1.json",
	},
	{
		name = "KafkaUser_v1alpha1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1alpha1.json",
	},
	{
		name = "KafkaUser_v1beta1",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1beta1.json",
	},
	{
		name = "KafkaUser_v1beta2",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/kafkauser_v1beta2.json",
	},
	{
		name = "StrimziPodSet",
		uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/kafka.strimzi.io/strimzipodset_v1beta2.json",
	},
}

local schemas = {}

for _, schema in ipairs(strimzi_schemas) do
	table.insert(schemas, {
		name = "kafka.strimzi.io - " .. schema.name,
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
