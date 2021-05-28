# Chapter 2 타입스크립트 프로젝트 생성과 관리


노드제이에스 프로젝트는 디렉터리에 package.json 파일을 만드는걸로 시작된다.
package.json: node.js가 관리하는 패키지 관리 파일

파일 생성 커맨드
> npm init --y

오픈소스패키지 설치 커맨드
> npm install  혹은 npm i

패키지 설치 명령 옵션
1. --save(-S): 프로젝트 실행할때 필요한 패키지로 설치. package.json의 dependency 항목에 등록됨
2. ---save-dev(-D): 프로젝트 개발할때만 필요한 패키지로 설치. package.json의 devDependency 항목에 등록됨

타입스크립트에 필요한 패키지: typescript, ts-node
- npm i -D typescript ts-node

타입스크립트 컼파일러는 타입이 명시적으로 설정되어 있어야만 코드 검증 후 코드를 동작시킨다. 즉, 순수 JS 파일을 동작시키려면 여러가지 타입 라이브러리를 제공해야만 가능하다.

다른 사람이 작성한 프로젝트를 전달받아 이용할 때는 package.json이 있는 디렉터리에서 npm i 를 실행하면 필요한 패키지들이 node_modules에 자동으로 설치된다.

tsconfig.json파일 만들기: 타입스크립트 프로젝트엔 TS컴파일러의 설정파일인 tsconfig.json이 필요한데, 이 파일은 tsc --init 명령으로 만들 수 있다.

프로젝트의 시작소스 파일명은 보통 index로 짓는데 보통 타입스크립트 소스파일 실행시 ts-node ./src/index.ts 명령을 사용하지만, index로 지을 경우엔 ts-node ./src 로 실행이 가능하다.

개발하는 동안엔 ts-node를 사용하지만, 개발 완료후에는 ES5 코드로 변환해 node로 실행시켜야 한다. 

Package.json의 scripts의 명령들은 'npm run <command>'로 실행한다.
- dev: 개발중 ts파일을 실행시키는 용도
- build: 개발 완료 후 프로그램을 배포하기 위해 ES5 파일을 만들때 사용

모듈
Export: 기능 제공시 사용
- export default: 한 모듈이 내보내는 기능중 오직 하나에만 붙일 수 있으며, import문으로 불러올때 중괄호 없이 사용이 가능하다.
Import: 다른 모둘의 기능 이용
- import {심벌목록} from '파일의 상대경로'
- import * as 심벌 from '파일의 상대경로'

## tsconfig.js
- module: 동작 대상 플랫ㄱ폼이 웹 브라우저인지 node.js인지 구분해 그에 맞는 모듈 방식으로 컴파일
- moduleResolution: module 키값이 commonjs면 node.js에서 동작하는걸 의미하므로 키값은 node, module 키값이 amd일 경우엔 classic으로 설정
- target: 트랜스파일할 대상 자바스크립트 버전
- baseUrl, outDir: 트랜스파일된 ES5 파일을 저장하는 디렉터리 설정
- paths: 소스 파일의 import 문에서 from 부분 해석시 찾아야하는 디렉터리 설정
- sourceMap: true -> 트랜스파일 디렉터리에 .js 외에도 js.map파일이 만들어짐. 뒤의 파일은 디버깅에 사용
- downlevelIterationL 생성기 구문이 정상적으로 동작하려면 반드시 true로 설정
- noImplicitAny: 타입을 지정하지 않아도 문제를 일으키지 않으려면 false로 설정