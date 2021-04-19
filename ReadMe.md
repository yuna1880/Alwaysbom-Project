## Flower Subscription & Shopping mall Website Project (Team)
##### Spring Framework 를 이용한 '새늘봄' 꽃 정기구독 사이트 (정기구독 & 꽃다발 쇼핑 & 플라워 클래스 구현)

[👉🏻 Click Here 👈🏻](http://alwaysbom.xyz/) Portfoilo Website

###### 📊 프로젝트 일정
---
###### (2021.03.11 - 4.13)




### 💡 팀 프로젝트 팀원 소개 

---

![Uploading Screenshot 2021-04-19 at 10.41.35 pm.png…](https://user-images.githubusercontent.com/72509037/115247025-60a11080-a161-11eb-9203-6dfb7186d2fd.png)
(권유나, 신동호, 윤민호, 이다솜, 이담영, 임하나 총 6명)

### 💡 기획 의도

---

![Uploading Screenshot 2021-04-19 at 10.41.50 pm.png…](https://user-images.githubusercontent.com/72509037/115247384-b675b880-a161-11eb-9523-fd553215125b.png)
![Uploading Screenshot 2021-04-19 at 10.41.58 pm.png…](https://user-images.githubusercontent.com/72509037/115247465-c5f50180-a161-11eb-8af0-71d4d9e16134.png)


### 💡 프로젝트 목표

---

![Uploading Screenshot 2021-04-19 at 10.42.09 pm.png…](https://user-images.githubusercontent.com/72509037/115247600-e3c26680-a161-11eb-9c47-f02c4b745d9d.png)
![Uploading Screenshot 2021-04-19 at 10.42.30 pm.png…](https://user-images.githubusercontent.com/72509037/115248104-592e3700-a162-11eb-9bb9-8d97204bafb0.png)


### 💡 프로젝트 개발환경 및 협업도구

---

![Uploading Screenshot 2021-04-19 at 10.42.16 pm.png…](https://user-images.githubusercontent.com/72509037/115247876-25eba800-a162-11eb-9870-dedf8e29070d.png)


### 💡 메인 화면 

---

![screencapture-localhost-8065-2021-04-19-22_56_47](https://user-images.githubusercontent.com/72509037/115248433-a6120d80-a162-11eb-9a7b-d39db90c02bd.png)


### 💡 내가 구현한 기능 소개 (권유나)
---

![Uploading Screenshot 2021-04-19 at 10.42.46 pm.png…](https://user-images.githubusercontent.com/72509037/115248153-68ad8000-a162-11eb-9769-e504239fc48d.png)

**`프론트오피스`** → **`꽃정기구독`** **`주문`** **`결제`** **`주문조회`**

**`백오피스`** → **`정기구독 관리(상품CRUD)`** **`상품주문 관리`**



### 📃 꽃 정기구독
---

![screencapture-localhost-8065-subs-2021-04-19-22_17_11](https://user-images.githubusercontent.com/72509037/115249746-e1610c00-a163-11eb-900f-75111802cabb.png)
javascript를 이용한 상단의 버튼을 누르면 페이지 이동 없이 화면이 변경되도록 처리.
![Uploading Screenshot 2021-04-19 at 10.17.41 pm.png…](https://user-images.githubusercontent.com/72509037/115249859-ff2e7100-a163-11eb-8fdc-8045bf6f9b68.png)
메인 페이지 구현 및 이용방법 컴포넌트 디자인 구현

### 📃 정기구독 상세페이지 구현
---

<img width="630" alt="Screenshot 2021-04-19 at 10 18 55 pm" src="https://user-images.githubusercontent.com/72509037/115250366-73691480-a164-11eb-9786-7028baeb0e08.png">
**`정기구독 상세페이지`** → 상품 선택 후, 날짜, 수량, 옵션 선택에 따라 박스 생성 및 합계금액 계산되도록 구현.
<img width="332" alt="Screenshot 2021-04-19 at 10 18 32 pm" src="https://user-images.githubusercontent.com/72509037/115250371-749a4180-a164-11eb-86b8-d01d132d02bf.png">
Date Picker 를 통한 날짜 선택 구현.


### 📃 주문 & 결제 구현
---

<img width="620" alt="Screenshot 2021-04-19 at 10 20 02 pm" src="https://user-images.githubusercontent.com/72509037/115251509-97792580-a165-11eb-91b6-c9a9194ba6f2.png">
**`주문`** → 상품 상세페이지에서 '편지추가' 옵션 선택시, 주문 페이지 이동 전 선택한 상품수만큼 편지 생성.
            Javascript로 편지 입력할때마다 실시간 글자수 카운트 및 미리보기 가능하도록 구현.
            
<img width="934" alt="Screenshot 2021-04-19 at 10 21 17 pm" src="https://user-images.githubusercontent.com/72509037/115252169-3271ff80-a166-11eb-9068-c333220c9203.png">
<img width="633" alt="Screenshot 2021-04-19 at 10 21 47 pm" src="https://user-images.githubusercontent.com/72509037/115252175-33a32c80-a166-11eb-9f73-8cffcd4557c4.png">

**`배송지 입력`** → **`Daum 주소 API`** 를 이용한 주소 검색 및 이용 가능.

<img width="447" alt="Screenshot 2021-04-19 at 11 27 39 pm" src="https://user-images.githubusercontent.com/72509037/115253143-0efb8480-a167-11eb-9b25-4c7a1ca98bac.png">
<img width="713" alt="Screenshot 2021-04-19 at 11 28 45 pm" src="https://user-images.githubusercontent.com/72509037/115253145-102cb180-a167-11eb-9f13-9bee6671c0e8.png">

배송지 저장 버튼 클릭시, 결제한 시점 이후로 배송지 저장되도록 구현. (다음 결제시 저장된 최근 배송지 확인 가능)


