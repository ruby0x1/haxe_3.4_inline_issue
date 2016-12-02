Inside `BalancedBST.hx`, find :test: in file
- iterator() function
- BalancedBSTIterator constructor

There are two `inline` calls.
Making either of them NOT inline fixes the issue.

The issue is present on at least C++, it's generating variables with a global scope an so on.

```
Error: ./src/Test.cpp:100:43: error: no member named '_g_rightest' in the global namespace
HXLINE(  18)                                    _hx_tmp1 = hx::IsNull( ::_g_rightest );
                                                                       ~~^
./src/Test.cpp:109:39: error: no member named '_g_tree' in the global namespace
HXLINE(  18)                                    _hx_tmp = (( (int)(::_g_tree->compare(_g_current->key,::_g_rightest->key)) ) <= (int)0);
                                                                   ~~^
./src/Test.cpp:109:74: error: no member named '_g_rightest' in the global namespace
HXLINE(  18)                                    _hx_tmp = (( (int)(::_g_tree->compare(_g_current->key,::_g_rightest->key)) ) <= (int)0);
                                                                                                      ~~^
./src/Test.cpp:119:46: error: no member named '_g_rightest' in the global namespace
HXLINE(  18)                                    _g_current3 = hx::IsNull( ::_g_rightest );
                                                                          ~~^
./src/Test.cpp:128:43: error: no member named '_g_tree' in the global namespace
HXLINE(  18)                                    _g_current2 = (( (int)(::_g_tree->compare(_g_current->key,::_g_rightest->key)) ) <= (int)0);
                                                                       ~~^
./src/Test.cpp:128:78: error: no member named '_g_rightest' in the global namespace
HXLINE(  18)                                    _g_current2 = (( (int)(::_g_tree->compare(_g_current->key,::_g_rightest->key)) ) <= (int)0);
                                                                                                          ~~^
./src/Test.cpp:143:83: error: no member named '_g_tree' in the global namespace
HXDLIN(  18)                                            HX_VARI_NAME(  ::BalancedBSTNode_Int_String,_temp1,"_temp") = ::_g_tree->root;
                                                                                                                      ~~^
./src/Test.cpp:145:52: error: no member named '_g_tree' in the global namespace
HXLINE(  18)                                                    HX_VARI( int,_comp) = ( (int)(::_g_tree->compare(_g_current->key,_temp1->key)) );
                                                                                              ~~^
8 errors generated.
```
