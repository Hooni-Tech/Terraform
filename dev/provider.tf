## 보안을 위해 Credentials 파일 사용
provider "aws" {
	shared_credentials_file = "${var.creds_path}"
	region = "${var.region}"
	profile = "${var.profile}"
}