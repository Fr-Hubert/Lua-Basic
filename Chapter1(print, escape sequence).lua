--------------------------------------------------
--[[ C言語との違い                            --]]
--[[ 1．メイン関数がなく、上から下に実行される。 --]]
--[[ 2．コードの終端にセミコロン(;)がない       --]]
--------------------------------------------------

--print文
print ("Hello World")
print ('Hello World')
print "Hello World"
print([[Hello World]])

--[[上記のprint文は出力結果がすべてHello Worldとして同じである。
ただし、8行目から10行目までは同じ意味で11行目はやや違う意味を持っている。--]]

--エスケープシークエンス
--------------------------------------------------------
--[[ 1．\n　改行                                       --]]
--[[ 2．\a　BEEP音（警告音）                            --]]
--[[ 3．\t　タブ                                       --]]
--[[ 4．\b　バックスペース                              --]]
--[[ 5．\'　シングルクォーテーション                     --]]
--[[ 6．\"　ダブルクォーテーション                       --]]
--[[ 7．\\　バックスラッシュ（日本語の端末の場合,円マーク）--]]
--------------------------------------------------------

--ここで11行目にもどるとprint([[]])の場合はエスケープ文字を無視して文字列をそのまま出力する。

--例文
print([[Hello\nWorld]])

--結果
--Hello\nWorld

--もし改行したい場合は下のようにコードを書く
print([[Hello
World!
こんにちは世界
]])

--長文を表示
--例文
print("Do not love the world or the things of the world. "..
"If anyone loves the world, the love of the Father is not in him.")
--結果
--Do not love the world or the things of the world. If anyone loves the world, the love of the Father is not in him.

--[[ ..という部分に注目
これは複数の文字列をつなぎ合わせるときに使用する。--]]

--ダブルクォーテーションを表示
--例え、下記のように出力したいと思ったとき
--Then God said, "Let there be light", and there was light.

print("Then God said, "Let there be light", and there was light.") --間違った作成例

print("Then God said, \"Let there be light\", and there was light.") --正しい作成例１
print([[Then God said, "Let there be light", and there was light.]]) --正しい作成例２（エスケープ文字を無視するため）
