## Flower Subscription & Shopping mall Website Project (Team)
##### Spring Framework 를 이용한 '새늘봄' 꽃 정기구독 사이트 (정기구독 & 꽃다발 쇼핑 & 플라워 클래스 구현)
###### 📊 프로젝트 일정 (2021.03.11 - 4.13)
###### [👉🏻 Portfolio Website 👈🏻](http://alwaysbom.xyz/)
---


### 💡 팀 프로젝트 팀원 소개 

---

![Uploading Screenshot 2021-04-19 at 10.41.35 pm.png…](https://user-images.githubusercontent.com/72509037/115247025-60a11080-a161-11eb-9203-6dfb7186d2fd.png)
- (권유나, 신동호, 윤민호, 이다솜, 이담영, 임하나 총 6명)
---
### 💡 기획 의도
---

![1](https://user-images.githubusercontent.com/72509037/117850634-7321ec00-b2c0-11eb-9598-1217f7f139cf.jpg)

---
### 💡 프로젝트 목표
---

![2](https://user-images.githubusercontent.com/72509037/117851053-e6c3f900-b2c0-11eb-9ec5-f2bb17fdd74f.jpg)

---
### 💡 프로젝트 개발환경 및 협업도구
---

![Uploading Screenshot 2021-04-19 at 10.42.16 pm.png…](https://user-images.githubusercontent.com/72509037/115247876-25eba800-a162-11eb-9870-dedf8e29070d.png)

---
### 💡 메인 화면 
---

![노션1](https://user-images.githubusercontent.com/72509037/117918444-f88bb780-b325-11eb-8c53-ff4e8e1badde.jpg)

---
### 💡 내가 구현한 기능 소개 (권유나)
---

![4](https://user-images.githubusercontent.com/72509037/117853159-0cea9880-b2c3-11eb-8bbc-e71c39024326.jpg)

- **`프론트오피스`** → **`꽃정기구독`** **`주문`** **`결제`** **`주문조회`**

- **`백오피스`** → **`정기구독 관리(상품CRUD)`** **`상품주문 관리`**


---
### 📃 꽃 정기구독
---

![screencapture-localhost-8065-subs-2021-04-19-22_17_11](https://user-images.githubusercontent.com/72509037/115249746-e1610c00-a163-11eb-900f-75111802cabb.png)

- javascript를 이용한 상단의 버튼을 누르면 페이지 이동 없이 화면이 변경되도록 처리.

![Uploading Screenshot 2021-04-19 at 10.17.41 pm.png…](https://user-images.githubusercontent.com/72509037/115249859-ff2e7100-a163-11eb-8fdc-8045bf6f9b68.png)

- 메인 페이지 구현 및 이용방법 컴포넌트 디자인 구현

---
### 📃 정기구독 상세페이지 구현
---

![상세페이지](https://user-images.githubusercontent.com/72509037/117916893-ff64fb00-b322-11eb-9e1b-7f4863303fd9.jpg)

- **`정기구독 상세페이지`** → 상품 선택 후, 날짜, 수량, 옵션 선택에 따라 박스 생성 및 합계금액 계산되도록 구현.
- Date Picker 를 통한 날짜 선택 구현. (날짜는 2주 단위로 선택 가능)


---
### 📃 정기구독 상품 등록 (관리자)
---
![11](https://user-images.githubusercontent.com/72509037/117925446-3262bb00-b332-11eb-861b-e278f335244b.jpg)
- 새로운 상품 등록 & 수정 & 삭제 가능하도록 구현. 이미지 3개까지 첨부 가능.
- CK에디터를 이용하여 상세페이지 글 작성 가능하도록 구현.
- 이미지는 GCP(구글 클라우드 플랫폼)서버에서 관리.

---
### 📃 주문 & 결제 구현
---

![5](https://user-images.githubusercontent.com/72509037/117918226-a054b580-b325-11eb-97d5-bb4a0129c47e.jpg)
- **`주문`** → 상품 상세페이지에서 '편지추가' 옵션 선택시, 주문 페이지 이동 전 선택한 상품수만큼 편지 생성.
- Javascript로 편지 입력할때마다 실시간 글자수 카운트 및 미리보기 가능하도록 구현.
- **`배송지 입력`** → **`Daum 주소 API`** 를 이용한 주소 검색 및 이용 가능.

![5 copy](https://user-images.githubusercontent.com/72509037/117918267-b5314900-b325-11eb-822d-e604f924c5ac.jpg)
- **`배송지 저장`** 버튼 클릭시, 입력한 주소가 결제 완료 시점에서 DB에 저장되어 다음 구매시 사용 가능하도록 구현.
- (다음 결제시 저장된 최근 배송지 확인 가능)


![6](https://user-images.githubusercontent.com/72509037/117918879-e9f1d000-b326-11eb-89ba-d4e805089931.jpg)
- **`결제 페이지`** -> 결제 전 고객이 마지막으로 확인하는 페이지. 
- 수령일, 구독 기간, 등 상세 정보 및 가격 확인 후 결제 전 총 금액을 확인 가능하도록 구현.
- **`등급 할인`** -> 현재 아이디의 등급은 ‘자스민’ 등급, 총 금액의 2%가 자동 할인 적용.
- 정책상 3만원 이상의 상품 주문시 -> **`무료배송`**
- **`포인트 사용`** -> 해당 회원이 보유하고 있는 포인트보다 높은 금액을 입력시‘사용가능한 포인트는 00원 입니다.’
- 알림 메세지가 뜨고 다시 입력할 수 있도록 구현. 알맞은 값을 입력시 포인트 적용 및 총 금액 자동 계산.


<img width="1091" alt="결제" src="https://user-images.githubusercontent.com/72509037/117920735-62a65b80-b32a-11eb-942e-9617414b1e7c.png">

- **`결제 API`** -> I'mport [KG inicis Pay] 를 이용해서 결제 API 연동 및 구현.
- (현재 포트폴리오용 사이트여서, 실제 결제되는 것을 방지하기 위해 결제로 넘어갈 시, 1원으로 설정)

---
### 📃 주문 조회
---

![7](https://user-images.githubusercontent.com/72509037/117921844-6804a580-b32c-11eb-88f2-51f84a735331.jpg)
- 해당 아이디로 결제한 주문 내역 조회 가능. **`주문상태`** -> **`입금대기`** **`취소요청`** **`취소완료`** **`결제완료`** **`배송중`** **`배송완료`** (총 6가지)
- **`사용자`** -> 마이페이지에서 취소요청 및 구매확정 (배송중 -> 배송완료) 로 상태 변경 가능.
- 주문 취소시, 관리자의 승인 후 취소 완료 처리.


![8](https://user-images.githubusercontent.com/72509037/117923201-9a170700-b32e-11eb-90a7-dca3094c15a4.jpg)
- **`배송완료`** 상태에서만 해당 상품에 대한 리뷰 작성 버튼이 생성되도록 구현.
- **`리뷰작성`** 시, 해당 상품의 idx 를 통해 해당 상품에 대한 리뷰로 저장.

---
### 📃 주문관리 (관리자)
---

![10](https://user-images.githubusercontent.com/72509037/117923916-db5be680-b32f-11eb-9341-93f6df3b5886.jpg)
- **`관리자 주문관리`** -> 페이지 이동 없이 한 페이지에서 6가지의 모든 주문상태를 조회 가능
- **`관리자`** 는 (취소요청 -> 취소완료)  , (결제완료 -> 배송중) 상태값 변경 가능하도록 구현.
- **`주문 상태에 따른 총 숫자`** -> 총 갯수 옆에 숫자로 표기 (주문 상태 변경시 동적으로 변경)


---
### 📑 프로젝트 리뷰 및 개선방향
---

- 효율적인 전체 구조 및 흐름에 대한 고민
- **중복되는 코드 정리** 및 클린코드에 대한 고민.
- ResultMap을 더욱 효율적으로 사용 가능한가? 에 대한 고민.
- 테스트 코드의 작성의 필요성.
- jira 일정관리 및 형상관리를 더욱 촘촘히 해야할 필요가 있다.

