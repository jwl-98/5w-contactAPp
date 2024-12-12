# 코어데이터를 이용한 연락처앱





![Simulator Screenshot - iPhone 16 Pro - 2024-12-12 at 19 45 48](https://github.com/user-attachments/assets/e6c89fc9-9142-4d8e-85c8-e3db68b06a53) |![Simulator Screenshot - iPhone 16 Pro - 2024-12-12 at 19 45 58](https://github.com/user-attachments/assets/cd2e938a-a09d-4aba-96c0-b02c89add39f) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-12 at 19 46 06](https://github.com/user-attachments/assets/a243dd78-4e5d-4ab0-8d51-cfdd8d752ca0) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-12 at 19 46 15](https://github.com/user-attachments/assets/22547881-bbab-476b-80e2-a253f972e8aa) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-12 at 19 46 19](https://github.com/user-attachments/assets/38b4ae39-eb91-4211-9c86-0b5e402344b4)
--- | --- | --- | --- | --- |
첫 화면 | 연락처 추가화면 | 랜덤버튼을 눌러 변경된 이미지| 저장버튼을 눌렀을떄 뜨는 팝업|확인버튼을 누른후 나오는 화면
# 프로젝트 소개
* 앱개발 숙련 주차에 발제된 과제입니다!
* 코어 데이터와 네트워킹 코드를 활용한 연락처 앱입니다.
* 포켓몬 캐릭저 이미지와 이름을 불러와 입맛대로 커스텀 해서 정보를 저장할수 있습니다!
* 저장된 데이터를 한눈에 볼수 있습니다.

# 개발기간
* 2024.12.9 ~ 2024.12.11
 ## 1. 개발환경
  * Back-End: https://pokeapi.co Api 활용
  * 버전 및 이슈관라: Github
  * 디자인: 클론
  * 서비스배포 환경: X
## 2. 핵심 개발 전략
* 코어데이터를 최대한 활용해보고자 Api 호출은 "랜덤 이미지 생성" 이라는 버튼을 눌렀을때만 호출이 되도록 구현했습니다.
* 입력된 데이터 (이미지, 이름, 전화번호)는 코어데이터 내부에 저장이 되고 저장된 데이터 기반으로 메인뷰에 존재하는 셀을 구성합니다.
* 코어데이터 속성은 전부 String형으로 구현했기 때문에 이미지를 Data타입으로 변환, base64EncodedString 형태로 코어테이터 내부에 저장시킵니다.
* 셀을 구성할때는 base64EncodedString 타입을 Data로 변환 최종적으로 UIImage로 변경시켜 저장된 이미지가 표시됩니다.

## 3. 프로젝트 구조
```shell
 Pokemon-Contact
│   ├── Pokemon-Contact
│   │   ├── Controller
│   │   │   ├── FirstViewController.swift
│   │   │   └── PhoneBookViewController.swift
│   │   ├── Data
│   │   │   ├── CoreData
│   │   │   │   ├── PhoneBook+CoreDataClass.swift
│   │   │   │   ├── PhoneBook+CoreDataProperties.swift
│   │   │   │   └── PhoneBookModel.xcdatamodeld
│   │   │   │       └── PhoneBookModel.xcdatamodel
│   │   │   │           └── contents
│   │   │   ├── PhoneBookData.swift
│   │   │   └── PhoneBookDataManager.swift
│   │   ├── Delegate
│   │   │   ├── AppDelegate.swift
│   │   │   └── SceneDelegate.swift
│   │   ├── Info.plist
│   │   ├── PokemonJson
│   │   │   ├── JsonDecoder.swift
│   │   │   ├── KRNameJson.swift
│   │   │   ├── PokemonDataJson.swift
│   │   │   └── PokemonUrl.swift
│   │   └── Views
│   │       ├── Base.lproj
│   │       │   └── LaunchScreen.storyboard
│   │       ├── PhoneBookView.swift
│   │       └── TableViewCell.swift
│   └── Pokemon-Contact.xcodeproj
│       ├── project.pbxproj
│       ├── project.xcworkspace
│       │   ├── contents.xcworkspacedata
│       │   ├── xcshareddata
│       │   │   └── swiftpm
│       │   │       ├── Package.resolved
│       │   │       └── configuration
│       │   └── xcuserdata
│       │       └── macintosh.xcuserdatad
│       │           └── UserInterfaceState.xcuserstate
│       └── xcuserdata
│           └── macintosh.xcuserdatad
│               ├── xcdebugger
│               │   └── Breakpoints_v2.xcbkptlist
│               └── xcschemes
│                   └── xcschememanagement.plist
└── README.md
```
