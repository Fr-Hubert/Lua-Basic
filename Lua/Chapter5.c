/****************/
/* C言語との連携 */
/****************/

//LuaとC言語を連携させるためには、スタックの仕組みを理解しておかなければならない
//LuaからC言語側にデータを渡す、またはC言語側からLuaにデータを渡す場合、Luaスタックと呼ばれるものを使用する。

/* スタックとは？ */
//スタック（Stack）は、Luaの実行環境で非常に重要な役割を果たしている。
//スタックは主に以下のような用途で使用される。

//1．関数呼び出しとローカル変数の管理：
//Luaはスタックを利用して関数の呼び出しを管理する。
//関数が呼び出されると、Luaはその関数のローカル変数や引数をスタックに積み込み、関数が終了するとこれらの値をスタックから取り出す。
//各関数呼び出しにはスタックフレームが割り当てられ、関数が実行される間、ローカル変数や引数はそのフレーム内で管理される。

//2．スクリプトとCとのインターフェース：
//LuaのC APIを使用する際には、Luaスタックが中心的な役割を果たす。
//CからLuaに値を渡すときや、LuaからCへ値を返すとき、スタックを使ってこれらのデータの受け渡しを行う。

//3．エラー処理：
//Luaのエラーハンドリングでは、エラーが発生した際にエラーメッセージをスタックに積んで、それを取得して処理することができる。

/* スタックの基本操作 */
//1．プッシュ（Push）：データをスタックに追加する操作。例えば、関数の引数や戻り値をスタックにプッシュする。
//2．ポップ（Pop）：スタックからデータを取り出す操作。関数が終了した際にローカル変数や引数がポップされる。
//3．トップ（Top）：スタックの最上部にあるデータを参照します。例えば、現在の関数の実行中にどのデータがスタックの一番上にあるかを確認する。

/* LuaのC APIにおけるスタック操作関数 */
//1．lua_pushxxx 系列関数（例：lua_pushnumber, lua_pushstring）は、値をスタックにプッシュする。
//2．lua_pop 関数は、スタックから値をポップする。
//3．lua_gettop 関数は、スタックのサイズ（トップのインデックス）を取得する。
//4．lua_settop 関数は、スタックのサイズを設定する。
//Luaのスタックは、スクリプトの実行、関数の呼び出し、およびCとLuaの相互作用において基本的な構造を提供し、効率的なデータ管理を実現する。


/* Luaの初期化 */

//下記のコードはC言語からLuaを利用するためのプログラムで、このプログラムはLuaを初期化したあと、何もしない

#include <stdio.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
 
intmain (void)
{
    lua_State* L = luaL_newstate();

    //ここに処理を書く

    lua_close(L);
    return0;
}

//Luaを呼び出すためには3つのヘッダファイル及びLuaのdllが必要である。
//luaStateはLuaインタプリタの状態全体を保持する不透明な構造体である。
//luaLnewstate()関数を呼び出すとLuaの新しい状態を作り出し，Luaが利用可能な状態となる。
//Luaを利用するためには必ずこの関数を呼び出すこととなる。
//luaState構造体であるLの中にはLuaインタプリタの現在の状態が保管されて、LuaをC言語側から利用する際には必ず利用する。
//またLuaを終了する場合はluaclose()関数を呼び出して、この関数を呼び出すことでステート内で使われていたすべての動的メモリを解放する。

/* Luaスタックへ値をプッシュ */

//Luaスタックへ値をプッシュする場合，luapush***関数を呼び出します。***の部分にはデータ型が入る。
//例えばboolean型をプッシュする場合はbooleanが，number型をプッシュする場合はnumberが入る。

lua_pushboolean(L,1);
lua_pushnumber(L,10.5);
lua_pushinteger(L,3);
lua_pushstring(L,"Helloworld");
lua_pushnil(L);

//Lua関係の関数は殆どの場合，第1引数にluaStateを渡す必要がある。

#include <stdio.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

voiddumpStack(lua_State* L)
{
    inti;
    //スタックに積まれている数を取得する
    intstackSize = lua_gettop(L);
    for( i =stackSize; i >= 1; i--) {
        inttype = lua_type(L,i);
        printf("Stack[%2d-%10s] : ", i, lua_typename(L,type) );

        switch(type ) {
        case LUA_TNUMBER:
            //number型
            printf("%f",lua_tonumber(L, i) );
            break;
        case LUA_TBOOLEAN:
            //boolean型
            if(lua_toboolean(L,i) ){
                printf("true");
            }else{
                printf("false");
            }
            break;
        case LUA_TSTRING:
            //string型
            printf("%s",lua_tostring(L, i) );
            break;
        case LUA_TNIL:
            //nil
            break;
        default:
            //その他の型
            printf("%s",lua_typename(L,type));
            break;
        }
        printf("\n");
    }
    printf("\n");
}

intmain (void)
{
    lua_State* L = luaL_newstate();

    lua_pushboolean(L, 1); //trueをpush
    dumpStack(L);
    lua_pushnumber(L,10.5); //10.5をpush
    dumpStack(L);
    lua_pushinteger(L, 3); //3をpush
    dumpStack(L);
    lua_pushnil(L);//nilをpush
    dumpStack(L);
    lua_pushstring(L,"Hello world"); //hello worldをpush
    dumpStack(L);

    lua_close(L);
    return0;
}

//ここではLuaスタックの状態を見るためdumpStack関数を作成し、この関数内の処理は現段階では理解しなくて結構である。
//スタックの一番下は1番目となっている。
//値をプッシュするごとに2番目、3番目と積み重ねられていく。
//dumpStack関数はスタックの位置、スタックに格納されているデータ型、及びデータの中身を表示する。
//ただし、データの中身を表示できるのはnumber,boolean,string,nilに限る。

//実行結果
//Stack[1- boolean]: true
//Stack[2- number] :10.500000
//Stack[1- boolean]: true
//Stack[3- number] :3.000000
//Stack[2- number] :10.500000
//Stack[1- boolean]: true
//Stack[4- nil] :
//Stack[3- number] :3.000000
//Stack[2- number] :10.500000
//Stack[1- boolean]: true
//Stack[5- string] :Hello world
//Stack[4- nil] :
//Stack[3- number] :3.000000
//Stack[2- number] :10.500000
//Stack[1- boolean]: true


/*  Luaスタックから値をポップ */

//Luaスタックから値をポップしてみましょう．値をポップするにはluapop()関数を利用する。

