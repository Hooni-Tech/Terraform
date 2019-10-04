1. Access Key / Secret Key 필요
 - 보안상 Credential 파일로 대체
2. PEM Key 사전 생성 필요
 - 최초 구성 시 PEM 생성 및 적용이 되지 않음
3. 초기 구축 시 .tfstate & backup 파일이 있다면 삭제 후 init 진행 
 - 예전 구축 했던 상태 값이 남아 있어 Error 발생하여 삭제 필요
4. variables 파일을 통하여 생성하는 방향으로 진행
 - Access Key / Secret Key 에 대한 Credential 변경 필요
 - PEM KEY 변경 필요
 - 자신에게 맞는 Name 및 Tag 필요
 5. .terraform Folder 업로드 못함 (100MB 초과)