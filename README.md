# README

## アプリケーション名
### Family

## アプリケーションの概要（実装中）
- 家族間でのコミュニケーションが取れるチャットアプリケーションです。

## URL
- https://family-28237.herokuapp.com/
## テスト用アカウント
### メッセージ送信者
- メールアドレス:asd@123
- パスワード:asd123
### メッセージ受信者
- メールアドレス:dsa@321
- パスワード:dsa321

## 利用方法
- 最初にユーザー登録をしていただいた後に、ルームを作成、または既存のルームに参加していただきます。
- ルームに参加すると、同じルームにいる人とメッセージ機能を用いて、やり取りを行うことができます。

## 目指した課題解決
- 小さい子供を持った共働きの家庭、災害の被害に遭っている方々の家族の安否を確認したいという問題を解決したいと思い、このアプリを作成することを考えました。
- 現時点では理想のアプリの状態には遥かに及ばないのですが、今後追加実装を行ってい、本来の目的を達成できるアプリにしていきたいと思っております。

## 洗い出した要件
### 機能
#### ユーザー管理機能
- ユーザーを新しく登録できる
- 登録しているユーザーはログインすることができる
- ユーザー情報を編集できる
- ログアウトできる

#### ルーム管理機能
- ルームを作成することができる
- 既存のルームに参加することができる

#### メッセージ機能
- メッセージを投稿することができる
- メッセージ一覧表示機能

## 実装した機能についてのGIFと説明

## 実装予定機能
- アルバム機能
- カレンダー共有機能
- メモ共有機能
- 避難場所明治機能
- フォロー機能
- ダイレクトメッセージ機能
- 家族の位置をリアルタイムで確認できる

## データベース設計 
### rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

#### Association

- has_many :users
- has_many :messages

### users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| email    | string     | null: false, unique: true      |
| password | string     | null: false                    |
| room     | references | null: false, foreign_key: true |

#### Association

- belongs_to :room
- has_many :messages

### messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| boorean | checked    |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

#### Association

- belongs_to :room
- belongs_to :user

### users テーブル

| Column   | Type       | Options            |
| -------- | ---------- | ------------------ |
| room     | references | null: false        |
| user     | references | null: false,       |

#### Association

- belongs_to :room
- belongs_to :user


## ローカルでの動作方法

### 「Ruby」「Ruby on railsのバージョンの確認
- Ruby 2.6.5
- Rails 6.0.3.2

### URL
git clone https://github.com/nomu-freedom/Family.git

### Gemのインストール
- bundle install

### データベースの作成
- rails db:create
- rails db:migrate

### サーバー起動
- rails s