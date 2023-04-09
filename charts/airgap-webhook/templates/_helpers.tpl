{{/*
Return the proper admission image name
*/}}
{{- define "admission.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.admission.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "admission.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "admission.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.admission.image .Values.volumePermissions.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "admission.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "admission.ingress.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the secretname of the tls volume to mount to the deployment
Ref: https://kubernetes.io/docs/concepts/configuration/secret/
*/}}
{{- define "admission.webhook.secretName" -}}
{{- if .Values.admission.admissionWebhook.certificate.provided -}}
{{ .Values.admission.admissionWebhook.secretName }}
{{- else -}}
{{ include "common.names.fullname" . }}-validation-webhook-keypair
{{- end -}}
{{- end -}}