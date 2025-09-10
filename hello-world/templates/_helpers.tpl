{{/*
Return the chart name
*/}}
{{- define "hello-world.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return a fully qualified name: <release>-<name>
*/}}
{{- define "hello-world.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "hello-world.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "hello-world.labels" -}}
app.kubernetes.io/name: {{ include "hello-world.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default .Chart.Version }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name (.Chart.Version | replace "+" "_") }}
{{- end -}}
