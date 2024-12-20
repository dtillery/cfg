FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� How to use this script:

This script will split the selection and add the photos to six albums:  
- LandscapeAlbum: an album with photos in landscape orientation
- PortraitAlbum:  an album with photos in portrait orientation
- SquareAlbum: an album with square photos
- PanoramicAlbumLandscape: an album with panoramic photos in landscape orientation
- PanoramicAlbumPortrait: an album with panoramic photos in portrait orientation
- PanoramicAlbumSkipped: an album with media items that do not have a width or height and cannot be classified


Open this script in Script Editor. Launch Photos.
Select the Photos you want to distribute between the albums.
A photo is considered to be panoramic if the ratio of width to height exceeds a threshold. This threshold is set as the variable AspectRatioThreshold. Change this variable to the ratio you want.

When all all photo are selected, press the "Run" button in Script Editor.

Author: l�onie
     � 	 	^   H o w   t o   u s e   t h i s   s c r i p t : 
 
 T h i s   s c r i p t   w i l l   s p l i t   t h e   s e l e c t i o n   a n d   a d d   t h e   p h o t o s   t o   s i x   a l b u m s :     
 -   L a n d s c a p e A l b u m :   a n   a l b u m   w i t h   p h o t o s   i n   l a n d s c a p e   o r i e n t a t i o n 
 -   P o r t r a i t A l b u m :     a n   a l b u m   w i t h   p h o t o s   i n   p o r t r a i t   o r i e n t a t i o n 
 -   S q u a r e A l b u m :   a n   a l b u m   w i t h   s q u a r e   p h o t o s 
 -   P a n o r a m i c A l b u m L a n d s c a p e :   a n   a l b u m   w i t h   p a n o r a m i c   p h o t o s   i n   l a n d s c a p e   o r i e n t a t i o n 
 -   P a n o r a m i c A l b u m P o r t r a i t :   a n   a l b u m   w i t h   p a n o r a m i c   p h o t o s   i n   p o r t r a i t   o r i e n t a t i o n 
 -   P a n o r a m i c A l b u m S k i p p e d :   a n   a l b u m   w i t h   m e d i a   i t e m s   t h a t   d o   n o t   h a v e   a   w i d t h   o r   h e i g h t   a n d   c a n n o t   b e   c l a s s i f i e d 
 
 
 O p e n   t h i s   s c r i p t   i n   S c r i p t   E d i t o r .   L a u n c h   P h o t o s . 
 S e l e c t   t h e   P h o t o s   y o u   w a n t   t o   d i s t r i b u t e   b e t w e e n   t h e   a l b u m s . 
 A   p h o t o   i s   c o n s i d e r e d   t o   b e   p a n o r a m i c   i f   t h e   r a t i o   o f   w i d t h   t o   h e i g h t   e x c e e d s   a   t h r e s h o l d .   T h i s   t h r e s h o l d   i s   s e t   a s   t h e   v a r i a b l e   A s p e c t R a t i o T h r e s h o l d .   C h a n g e   t h i s   v a r i a b l e   t o   t h e   r a t i o   y o u   w a n t . 
 
 W h e n   a l l   a l l   p h o t o   a r e   s e l e c t e d ,   p r e s s   t h e   " R u n "   b u t t o n   i n   S c r i p t   E d i t o r . 
 
 A u t h o r :   l � o n i e 
   
  
 l     ��  ��    #  Albums for widescreen photos     �   :   A l b u m s   f o r   w i d e s c r e e n   p h o t o s      l     ��������  ��  ��        l     ����  r         m        �    W i d e s c r e e n  o      ���� *0 widescreenalbumname WidescreenAlbumName��  ��        l     ��  ��    g a change this to the name of the album where you want to collect the horizontally panoramic Photos     �   �   c h a n g e   t h i s   t o   t h e   n a m e   o f   t h e   a l b u m   w h e r e   y o u   w a n t   t o   c o l l e c t   t h e   h o r i z o n t a l l y   p a n o r a m i c   P h o t o s      l     ��������  ��  ��         l     ��������  ��  ��      !�� ! l  y "���� " O   y # $ # k   x % %  & ' & I   ������
�� .miscactvnull��� ��� null��  ��   '  ( ) ( l   �� * +��   * &   Ensure that the albums do exist    + � , , @   E n s u r e   t h a t   t h e   a l b u m s   d o   e x i s t )  - . - l   ��������  ��  ��   .  / 0 / Q    F 1 2 3 1 k    3 4 4  5 6 5 Z    * 7 8���� 7 H     9 9 l    :���� : I   �� ;��
�� .coredoexnull���     **** ; 4    �� <
�� 
IPct < o    ���� *0 widescreenalbumname WidescreenAlbumName��  ��  ��   8 I   &���� =
�� .corecrel****      � null��   = �� > ?
�� 
kocl > m     ��
�� 
IPal ? �� @��
�� 
naME @ o   ! "���� *0 widescreenalbumname WidescreenAlbumName��  ��  ��   6  A B A r   + 1 C D C 4   + /�� E
�� 
IPct E o   - .���� *0 widescreenalbumname WidescreenAlbumName D o      ���� 0 thepanohalbum thePanoHAlbum B  F�� F l  2 2��������  ��  ��  ��   2 R      �� G H
�� .ascrerr ****      � **** G o      ���� 0 
errtexttwo 
errTexttwo H �� I��
�� 
errn I o      ���� 0 	errnumtwo 	errNumtwo��   3 I  ; F�� J��
�� .sysodlogaskr        TEXT J b   ; B K L K b   ; @ M N M b   ; > O P O m   ; < Q Q � R R ( C a n n o t   o p e n   a l b u m s :   P o   < =���� 0 	errnumtwo 	errNumtwo N o   > ?��
�� 
ret  L o   @ A���� 0 
errtexttwo 
errTexttwo��   0  S T S l  G G��������  ��  ��   T  U V U l  G G�� W X��   W < 6 process the selected photos from the All Photos album    X � Y Y l   p r o c e s s   t h e   s e l e c t e d   p h o t o s   f r o m   t h e   A l l   P h o t o s   a l b u m V  Z [ Z Q   G i \ ] ^ \ r   J T _ ` _ l  J P a���� a e   J P b b 1   J P��
�� 
selc��  ��   ` o      ���� 0 imagesel imageSel ] R      �� c d
�� .ascrerr ****      � **** c o      ���� 0 
errtexttwo 
errTexttwo d �� e��
�� 
errn e o      ���� 0 	errnumtwo 	errNumtwo��   ^ I  \ i�� f��
�� .sysodlogaskr        TEXT f b   \ e g h g b   \ c i j i b   \ a k l k m   \ _ m m � n n 4 C a n n o t   g e t   t h e   s e l e c t i o n :   l o   _ `���� 0 	errnumtwo 	errNumtwo j o   a b��
�� 
ret  h o   c d���� 0 
errtexttwo 
errTexttwo��   [  o p o l  j j��������  ��  ��   p  q r q l  j p s t u s r   j p v w v J   j l����   w o      ���� 0 widescreens   t $  the list of widescreen photos    u � x x <   t h e   l i s t   o f   w i d e s c r e e n   p h o t o s r  y z y l  q q��������  ��  ��   z  { | { l  q q��������  ��  ��   |  } ~ } l  q q��  ���    C =	check, if the album or the selected photos do contain images    � � � � z 	 c h e c k ,   i f   t h e   a l b u m   o r   t h e   s e l e c t e d   p h o t o s   d o   c o n t a i n   i m a g e s ~  � � � l  q q��������  ��  ��   �  ��� � Z   qx � ��� � � =  q w � � � o   q t���� 0 imagesel imageSel � J   t v����   � R   z ��� ���
�� .ascrerr ****      � **** � m   |  � � � � � 4 P l e a s e   s e l e c t   s o m e   i m a g e s .��  ��   � k   �x � �  � � � X   �i ��� � � k   �d � �  � � � Q   � � � � � k   � � � �  � � � l  � ���������  ��  ��   �  ��� � O   � � � � � l  � � � � � � k   � � � �  � � � r   � � � � � n  � � � � � 1   � ���
�� 
phit �  g   � � � o      ���� 0 h   �  ��� � r   � � � � � n  � � � � � 1   � ���
�� 
pwid �  g   � � � o      ���� 0 w  ��   �  get the pixel size    � � � � $ g e t   t h e   p i x e l   s i z e � o   � ����� 0 im  ��   � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errtext errText � �� ���
�� 
errn � o      ���� 0 errnum errNum��   � k   � � �  � � � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � �  E r r o r :   � o   � ����� 0 errnum errNum � o   � ���
�� 
ret  � o   � ����� 0 errtext errText � m   � � � � � � �  T r y i n g   a g a i n��   �  � � � Q   � � � � � k   � � � �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  ��� � O   � � � � � k   � � � �  � � � r   � � � � � n  � � � � � 1   � ���
�� 
phit �  g   � � � o      ���� 0 h   �  ��� � r   � � � � � n  � � � � � 1   � ���
�� 
pwid �  g   � � � o      ���� 0 w  ��   � o   � ����� 0 im  ��   � R      � � �
� .ascrerr ****      � **** � o      �~�~ 0 
errtexttwo 
errTexttwo � �} ��|
�} 
errn � o      �{�{ 0 	errnumtwo 	errNumtwo�|   � I  ��z ��y
�z .sysodlogaskr        TEXT � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � L S k i p p i n g   i m a g e   d u e   t o   r e p e a t e d   e r r o r :   � o   � ��x�x 0 	errnumtwo 	errNumtwo � o   � ��w
�w 
ret  � o   � ��v�v 0 
errtexttwo 
errTexttwo�y   �  ��u � l �t�s�r�t  �s  �r  �u   �  � � � r   � � � G   � � � l  ��q�p � =  � � � o  �o�o 0 w   � m  �n
�n 
msng�q  �p   � l  ��m�l � =  � � � o  �k�k 0 h   � m  �j
�j 
msng�m  �l   � o      �i�i 0 nodimensions noDimensions �  � � � Z  b � ��h � � o  "�g�g 0 nodimensions noDimensions � r  %0 � � � b  %, � � � J  %( � �  ��f � o  %&�e�e 0 im  �f   � o  (+�d�d 0 skipped   � o      �c�c 0 skipped  �h   � Z  3b � ��b�a � l 3P ��`�_ � F  3P   @  3> ^  3: o  36�^�^ 0 w   o  69�]�] 0 h   m  := ?�333333 B  AL ^  AH	
	 o  AD�\�\ 0 w  
 o  DG�[�[ 0 h   m  HK ?��������`  �_   � r  S^ b  SZ J  SV �Z o  ST�Y�Y 0 im  �Z   o  VY�X�X 0 widescreens   o      �W�W 0 widescreens  �b  �a   � �V l cc�U�T�S�U  �T  �S  �V  �� 0 im   � o   � ��R�R 0 imagesel imageSel �  l jj�Q�P�O�Q  �P  �O    I ju�N
�N .IPXSaddpnull���     **** o  jm�M�M 0 widescreens   �L�K
�L 
toAl o  pq�J�J 0 thepanohalbum thePanoHAlbum�K    l vv�I�H�G�I  �H  �G   �F L  vx�E�E  �F  ��   $ m    �                                                                                  Phts  alis    0  Macintosh HD                   BD ����
Photos.app                                                     ����            ����  
 cu             Applications  !/:System:Applications:Photos.app/    
 P h o t o s . a p p    M a c i n t o s h   H D  System/Applications/Photos.app  / ��  ��  ��  ��       
�D  !"�C�B�A�D   �@�?�>�=�<�;�:�9
�@ .aevtoappnull  �   � ****�? *0 widescreenalbumname WidescreenAlbumName�> 0 thepanohalbum thePanoHAlbum�= 0 imagesel imageSel�< 0 widescreens  �; 0 h  �: 0 w  �9 0 nodimensions noDimensions �8#�7�6$%�5
�8 .aevtoappnull  �   � ****# k    y&&  ''  !�4�4  �7  �6  $ �3�2�1�0�/�3 0 
errtexttwo 
errTexttwo�2 0 	errnumtwo 	errNumtwo�1 0 im  �0 0 errtext errText�/ 0 errnum errNum% * �.�-�,�+�*�)�(�'�&�%�$( Q�#�"�!�  m� ��������) � �� ��������. *0 widescreenalbumname WidescreenAlbumName
�- .miscactvnull��� ��� null
�, 
IPct
�+ .coredoexnull���     ****
�* 
kocl
�) 
IPal
�( 
naME�' 
�& .corecrel****      � null�% 0 thepanohalbum thePanoHAlbum�$ 0 
errtexttwo 
errTexttwo( ���
� 
errn� 0 	errnumtwo 	errNumtwo�  
�# 
ret 
�" .sysodlogaskr        TEXT
�! 
selc�  0 imagesel imageSel� 0 widescreens  
� 
cobj
� .corecnte****       ****
� 
phit� 0 h  
� 
pwid� 0 w  � 0 errtext errText) ���
� 
errn� 0 errnum errNum�  
� .sysodelanull��� ��� nmbr
� 
msng
� 
bool� 0 nodimensions noDimensions� 0 skipped  
� 
toAl
� .IPXSaddpnull���     ****�5z�E�O�r*j O '*��/j  *����� 
Y hO*��/E�OPW X  �%�%�%j O *a ,EE` W X  a �%�%�%j OjvE` O_ jv  )ja Y � �_ [�a l kh  � *a ,E` O*a ,E` UW QX  a �%�%�%a %j O #lj  O� *a ,E` O*a ,E` UW X  a !�%�%�%j OPO_ a " 
 _ a " a #&E` $O_ $ �kv_ %%E` %Y 1_ _ !a &	 _ _ !a 'a #& �kv_ %E` Y hOP[OY�-O_ a (�l )OhU  ** �
+�	
�
 
IPct+ �,, V 6 4 8 7 0 2 4 F - 4 6 D A - 4 7 B 7 - 8 A 6 3 - A 3 8 5 0 0 E 9 9 A 9 0 / L 0 / 0 4 0
�	 kfrmID  ! �-� 	- 	 ./0123456. 77 8�9�8 �:�
� 
IPal: �;; V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
� kfrmID  
� 
IPmi9 �<< V D B 9 B 5 A C A - B 0 6 E - 4 7 2 B - 9 7 4 2 - 8 7 8 6 2 A 7 A 0 D 2 B / L 0 / 0 0 1
� kfrmID  / == >�?�> �@� 
� 
IPal@ �AA V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�  kfrmID  
� 
IPmi? �BB V 1 A 1 0 5 1 6 5 - 0 F 2 4 - 4 5 A B - A B B 0 - 4 2 9 4 A A F 4 9 0 F 2 / L 0 / 0 0 1
� kfrmID  0 CC D��E��D ��F��
�� 
IPalF �GG V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmiE �HH V 2 7 C 3 8 8 5 8 - 1 5 5 F - 4 1 6 7 - B E C F - 6 A 3 8 F 2 6 C 3 3 F 1 / L 0 / 0 0 1
�� kfrmID  1 II J��K��J ��L��
�� 
IPalL �MM V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmiK �NN V E 7 D F F 8 0 4 - 9 E B 3 - 4 8 0 A - 8 4 D B - 2 B 3 2 9 D 7 C A 0 D 6 / L 0 / 0 0 1
�� kfrmID  2 OO P��Q��P ��R��
�� 
IPalR �SS V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmiQ �TT V 2 3 C 4 C E 2 B - 6 D 2 C - 4 8 2 C - B E B F - 8 2 8 2 6 6 7 E B 4 5 C / L 0 / 0 0 1
�� kfrmID  3 UU V��W��V ��X��
�� 
IPalX �YY V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmiW �ZZ V E 4 2 6 8 1 1 8 - 1 8 8 7 - 4 7 2 F - A 2 8 8 - 1 E C 6 E 9 B 3 5 B F 4 / L 0 / 0 0 1
�� kfrmID  4 [[ \��]��\ ��^��
�� 
IPal^ �__ V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmi] �`` V D 0 2 1 B 6 1 1 - D 9 C F - 4 B 9 3 - 8 F 7 3 - C F A C 2 7 8 8 2 F F 8 / L 0 / 0 0 1
�� kfrmID  5 aa b��c��b ��d��
�� 
IPald �ee V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmic �ff V 2 5 3 F C 4 5 4 - 1 9 4 0 - 4 F 6 4 - A E 4 B - B 6 7 F 8 C 8 9 2 A C F / L 0 / 0 0 1
�� kfrmID  6 gg h��i��h ��j��
�� 
IPalj �kk V F 9 E 9 C E 0 B - E D D 8 - 4 3 6 2 - B E A B - 3 2 7 1 D E 9 C 2 E C 5 / L 0 / 0 4 0
�� kfrmID  
�� 
IPmii �ll V C 2 8 3 C 3 3 0 - 3 F E 4 - 4 E 9 0 - A E 2 3 - 4 C 3 9 F 6 7 F 2 B A D / L 0 / 0 0 1
�� kfrmID  " ��m�� m  nopqn rr !����
�� 
cobj�� o ss !����
�� 
cobj�� p tt !����
�� 
cobj�� q uu !����
�� 
cobj�� �C@�B`
�A boovfals ascr  ��ޭ