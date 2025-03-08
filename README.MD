## 搭建前端项目的基本流程

> 搭建前端项目的流程就是前端工程化的流程（可以查一查工程化的含义）
>
> 一般来说，脚手架包括目录结构定义、必要的项目配置文件与工具配置文件、工具与命令。

### 初始化项目

> 项目开始前请先在磁盘中创建一个存放项目的文件夹
>
> 在此文件夹下进行初始化操作
>
> 初始化操作只需执行一个命令即可<font color="#ffa631">`npm init`</font>
>
> 命令执行后会要求填写一些初始化信息，信息填完之后输入 yes 回车即可
>
> 回车之后正常情况在项目文件夹下会生成一个 package.json 文件，这个文件是你整个项目的描述文件，很重要

### 技术选型

> 一般在搭建一个项目时就需要定好选用什么样的技术来进行开发，比如选用什么样的前端框架（vue、react、angular...）、UI 库(antd、element、vant、iview...)、css 预处理器（less、scss、uno...）、脚本语言（typescript、javascript...）...
>
> 选好技术之后在搭建项目时才知道要创建什么样的目录和文件，要安装哪些依赖等

### 目录结构

> 一个项目如果没有一个清晰的目录结构的划分会影响后期开发进度，对应的代码就要放在对应的目录下边，这样方便代码阅读也方便后期维护和扩展。
>
> 一个好的目录结构应当具有以下的一些特点：
>
> 解耦：代码尽量去耦合，这样代码逻辑清晰，也容易扩展
>
> 分块：按照功能对代码进行分块、分组，并能快捷的添加分块、分组
>
> 编辑器友好：需要更新功能时，可以很快的定位到相关文件，并且这些文件应该是很靠近的，而不至于到处找文件
>
> 目录结构的创建方式一般有以下两种（可以配合使用）
>
> 类型分组（按文件类型、业务类型等进行分组）
>
> 模块分块（按页面模块、业务模块等进行分块）

**比较好的单页面应用目录结构**

```js
|-- src/ 源代码目录
|-- page1/ page1 页面的工作空间
    |-- index.js 入口文件
    |-- services/ service 目录
    |-- models/ model 目录
    |-- mock/ 本地 json 数据模拟
    |-- images/ 图片文件目录
    |-- components/ 组件目录（如果基于 react, vue 等组件化框架）
    |-- ...

|-- module1/ 子目录
    |-- page2/ page2 页面的工作空间（内部结构参考 page1）
|-- ...
```

### 项目规范化配置

> 一个项目要有自己的规范化的配置，来约定开发过程中的规则，保障项目质量。
>
> 一个项目的规范要根据项目的技术选型来定，某些不同的技术会有不同的规范和约定
>
> 也有一些规范是通用的，比如 Prettier 代码格式化、ESLint 代码规范校验、EditorConfig 代码风格统一、（stylelint）样式规范校验、代码提交校验（Git Hook）、Commit Message 规范...

### 项目配置文件定义

> 项目的配置文件就是对项目中不同类型文件的处理和约定，是为了保证项目正常解析正常运行，
>
> 所以配置文件也要根据技术选型来定义，针对不同的技术定义不同的配置文件
>
> 也有一些配置文件是通用的，比如 package.json 文件，这是每个前端项目必备的文件，项目初始化时都会产生这个文件。README.md 文件，项目的说明文件。.gitignore 文件，git 忽略配置文件（用于指定哪些文件或目录不需要进行 git 版本控制。），.editorconfig 编辑器配置文件，.npmrc: npm 配置文件，.npmignore: npm 忽略配置文件，.babelrc: babel 配置文件。。。

### 实际搭建演练

> 接下来就根据上边的介绍来一次实际的搭建过程，分析一下实际搭建过程中需要注意的细节

#### 第一步初始化项目

- 创建一个项目文件夹
  ![alt text](/public/mdImage/image.png)
- 执行命令`npm init`
  ![alt text](/public/mdImage/image-1.png)

  > 命令执行完毕后出现了如下几个选项：
  >
  > 项目名称：默认文件夹名称
  >
  > package name: (my-project-web-cli)
  >
  > 版本号：默认 1.0.0
  >
  > version: (1.0.0)
  >
  > 项目描述：可以不写也可以简单描述
  >
  > description: 测试初始化项目
  >
  > 项目入口文件：默认 index.js,可以根据自身需求更改
  >
  > entry point: (index.js) main.js
  >
  > 测试命令：可忽略
  >
  > test command:
  >
  > git 存储库地址：可忽略
  >
  > git repository:
  >
  > 关键字：可忽略
  >
  > keywords:
  >
  > 作者：可忽略
  >
  > author:
  >
  > 许可证：默认 isc
  >
  > license: (ISC)
  >
  > 上述选项可选填，一路回车

  初始化完成后会输出以下确认内容，直接输入 yes 回车即可
  ![alt text](/public/mdImage/image-2.png)
  回车之后项目目录中会多出一个 package.json 文件，文件中会包含刚刚项目创建时输出的内容（一些基本信息），如下图：
  ![alt text](/public/mdImage/image-3.png)
  刚刚初始化时所填的信息都在这里，后期如果想修改可以在这里修改，至此项目初始化基本完成。

#### 第二步技术选型

> 假设我们要开发一个管理后台项目

**技术选择：**

包管理工具——>pnpm

构建工具——>vite

前端框架——>vue3

脚本语言——>javascript

UI 组件库——>element-plus

样式处理——>sass+unocss

...

**依赖安装：**

<font color="#ffa631">`npm i pnpm -g`</font>

<font color="#ffa631">`pnpm add vue@next`</font>

> 如果出现以下报错
> ![alt text](/public/mdImage/image-4.png)
>
> 根据提示运行`pnpm view vue versions`查看可安装的版本
>
> ![alt text](/public/mdImage/image-5.png)
>
> 如果输出类似以上内容,选择执行下边两个命令
>
> 安装最新稳定版 Vue 3
>
> pnpm add vue@latest
>
> 或指定具体版本（推荐)
>
> pnpm add vue@3.4.21

<font color="#ffa631">`pnpm add vite @vitejs/plugin-vue @vue/compiler-sfc -D`</font>
以下是正确安装后的输出

![alt text](/public/mdImage/image-6.png)

<font color="#ffa631"> `pnpm add element-plus --save-dev` </font>

![alt text](/public/mdImage/image-7.png)

<font color="#ffa631">`pnpm add sass --save-dev`</font>

![alt text](/public/mdImage/image-8.png)

<font color="#ffa631">`pnpm add unocss --save-dev`</font>

![alt text](/public/mdImage/image-9.png)

以上安装的所有依赖都可在`package.json`文件中查看版本

![alt text](/public/mdImage/image-10.png)

#### 第三步目录结构搭建

> 这里我们只搭建简单的目录结构，后续随着项目的扩展再丰富目录结构
>
> ![alt text](/public/mdImage/image-11.png)

- public 公共资源文件夹
- src 源代码文件夹
- src/components 公共组件文件夹
- App.vue 组件的入口文件
- main.js 项目的入口文件
- index.html html 文件模板
- package.json
- vite.config.js vite 的配置文件

#### 第四步项目规范化配置

<font color="#ffa631">`Prettier 代码格式化`</font>

> prettier 是一个代码格式化工具，可以通过自定义规则来重新规范项目中的代码，去掉原始的代码风格，确保团队的代码使用统一相同的格式。

**官网：** [https://prettier.io/](https://prettier.io/)

**安装：**

```bash
npm install --save-dev --save-exact prettier
yarn add --dev --exact prettier
pnpm add --save-dev --save-exact prettier
```

![alt text](/public/mdImage/image-12.png)
**安装插件：Prettier**
![alt text](/public/mdImage/image-13.png)
在设置中设置
![alt text](/public/mdImage/image-14.png)

**配置：**<font color="#ffa631">`.prettierrc`</font>

> 了解.prettierrc配置：https://cloud.tencent.com/developer/article/2043395

```js
module.exports = {
  // 1.一行代码的最大字符数，默认是80(printWidth: <int>)
  printWidth: 80,
  // 2.tab宽度为2空格(tabWidth: <int>)
  tabWidth: 2,
  // 3.是否使用tab来缩进，我们使用空格(useTabs: <bool>)
  useTabs: false,
  // 4.结尾是否添加分号，false的情况下只会在一些导致ASI错误的其工况下在开头加分号，我选择无分号结尾的风格(semi: <bool>)
  semi: false,
  // 5.使用单引号(singleQuote: <bool>)
  singleQuote: true,
  // 6.object对象中key值是否加引号（quoteProps: "<as-needed|consistent|preserve>"）as-needed只有在需求要的情况下加引号，consistent是有一个需要引号就统一加，preserve是保留用户输入的引号
  quoteProps: 'as-needed',
  // 7.在jsx文件中的引号需要单独设置（jsxSingleQuote: <bool>）
  jsxSingleQuote: false,
  // 8.尾部逗号设置，es5是尾部逗号兼容es5，none就是没有尾部逗号，all是指所有可能的情况，需要node8和es2017以上的环境。（trailingComma: "<es5|none|all>"）
  trailingComma: 'es5',
  // 9.object对象里面的key和value值和括号间的空格(bracketSpacing: <bool>)
  bracketSpacing: true,
  // 10.jsx标签多行属性写法时，尖括号是否另起一行(jsxBracketSameLine: <bool>)
  jsxBracketSameLine: false,
  // 11.箭头函数单个参数的情况是否省略括号，默认always是总是带括号（arrowParens: "<always|avoid>"）
  arrowParens: 'always',
  // 12.range是format执行的范围，可以选执行一个文件的一部分，默认的设置是整个文件（rangeStart: <int>  rangeEnd: <int>）
  rangeStart: 0,
  rangeEnd: Infinity,
  // 18. vue script和style标签中是否缩进,开启可能会破坏编辑器的代码折叠
  vueIndentScriptAndStyle: false,
  // 19.    endOfLine: "<lf|crlf|cr|auto>" 行尾换行符,默认是lf,
  endOfLine: 'lf',
  // 20.embeddedLanguageFormatting: "off",默认是auto,控制被引号包裹的代码是否进行格式化
  embeddedLanguageFormatting: 'off',
}
```

**配置:**`.prettierignore`，排除不必要的文件

```js
*.svg
package.json
.DS_Store
.eslintignore
*.png
*.toml
.editorconfig
.gitignore
.prettierignore
LICENSE
.eslintcache
*.lock
yarn-error.log
/build
/public

```

**添加脚本：**

> 配置完成后可在`package.json`文件中的`script`字段中配置可执行脚本
> 有关脚本的配置会在后续单独讲解

```json
"script":{
  "lint:prettier": "prettier --check \"src/**/*\" --end-of-line auto",
  "prettier": "prettier -c --write \"src/**/*\""
}
```

`ESLint 代码规范校验`

> ESlint是一个用于识别和报告代码语法规范的工具
> 了解ESLint : https://eslint.org/docs/latest/use/getting-started

**依赖安装：**

```bash
npm install eslint eslint-plugin-vue eslint-config-prettier @babel/eslint-parser --save-dev
yarn add eslint eslint-plugin-vue eslint-config-prettier @babel/eslint-parser --save-dev
pnpm add eslint eslint-plugin-vue eslint-config-prettier @babel/eslint-parser --save-dev

```

![alt text](/public/mdImage/image-15.png)

**插件安装：**
![alt text](/public/mdImage/image-16.png)

**配置：**`.eslintrc`

> 了解.eslintrc配置：https://zh-hans.eslint.org/docs/latest/use/configure/configuration-files
> https://daiwanxing.github.io/blog/articles/javascript/eslint.html

```json
{
  "root": true,
  "env": {
    "node": true,
    "es2021": true
  },
  "extends": ["eslint:recommended", "plugin:vue/vue3-recommended", "prettier"],
  "parser": "vue-eslint-parser",
  "parserOptions": {
    "parser": "@babel/eslint-parser",
    "sourceType": "module"
  },
  "rules": {
    "vue/multi-word-component-names": "off"
  }
}
```

3. 关键配置项说明
   字段 作用
   "root" 标记为根配置，避免继承上级目录的 ESLint 配置
   "env" 定义环境变量（如 node: true 启用 Node.js 全局变量）
   "extends" 继承的规则集（顺序靠后的配置会覆盖前面的）
   "parser" 主解析器，必须为 vue-eslint-parser 以解析 .vue 文件
   "parserOptions.parser" 子解析器，处理 <script> 中的代码（JavaScript/TypeScript）
   "rules" 自定义规则覆盖（优先级最高）

**配置忽略文件：**`.eslintignore`

```bash
# 忽略整个目录
dist/
node_modules/

# 忽略特定文件类型
*.log
*.md

# 忽略具体文件
src/experimental/*.js
public/test-data.json
```

**添加脚本：**

```json
{
  "scripts": {
    "lint": "eslint . --ext .vue,.js,.ts --fix",
    "lint:check": "eslint . --ext .vue,.js,.ts"
  }
}
```
