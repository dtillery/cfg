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
 l     ��  ��    #  Albums for widescreen photos     �   :   A l b u m s   f o r   w i d e s c r e e n   p h o t o s      l     ��������  ��  ��        l     ����  r         m        �    P i c t u r e   F r a m e  o      ����  0 framealbumname FrameAlbumName��  ��        l     ��  ��    g a change this to the name of the album where you want to collect the horizontally panoramic Photos     �   �   c h a n g e   t h i s   t o   t h e   n a m e   o f   t h e   a l b u m   w h e r e   y o u   w a n t   t o   c o l l e c t   t h e   h o r i z o n t a l l y   p a n o r a m i c   P h o t o s      l     ��������  ��  ��         l     ��������  ��  ��      !�� ! l  g "���� " O   g # $ # k   f % %  & ' & I   ������
�� .miscactvnull��� ��� null��  ��   '  ( ) ( l   �� * +��   * &   Ensure that the albums do exist    + � , , @   E n s u r e   t h a t   t h e   a l b u m s   d o   e x i s t )  - . - l   ��������  ��  ��   .  / 0 / Q    F 1 2 3 1 k    3 4 4  5 6 5 Z    * 7 8���� 7 H     9 9 l    :���� : I   �� ;��
�� .coredoexnull���     **** ; 4    �� <
�� 
IPct < o    ����  0 framealbumname FrameAlbumName��  ��  ��   8 I   &���� =
�� .corecrel****      � null��   = �� > ?
�� 
kocl > m     ��
�� 
IPal ? �� @��
�� 
naME @ o   ! "����  0 framealbumname FrameAlbumName��  ��  ��   6  A B A r   + 1 C D C 4   + /�� E
�� 
IPct E o   - .����  0 framealbumname FrameAlbumName D o      ���� 0 theframealbum theFrameAlbum B  F�� F l  2 2��������  ��  ��  ��   2 R      �� G H
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
errTexttwo��   [  o p o l  j j��������  ��  ��   p  q r q l  j p s t u s r   j p v w v J   j l����   w o      ���� 0 pics   t #  the list of frameable photos    u � x x :   t h e   l i s t   o f   f r a m e a b l e   p h o t o s r  y z y l  q q��������  ��  ��   z  { | { l  q q��������  ��  ��   |  } ~ } l  q q��  ���    C =	check, if the album or the selected photos do contain images    � � � � z 	 c h e c k ,   i f   t h e   a l b u m   o r   t h e   s e l e c t e d   p h o t o s   d o   c o n t a i n   i m a g e s ~  � � � l  q q��������  ��  ��   �  ��� � Z   qf � ��� � � =  q w � � � o   q t���� 0 imagesel imageSel � J   t v����   � R   z ��� ���
�� .ascrerr ****      � **** � m   |  � � � � � 4 P l e a s e   s e l e c t   s o m e   i m a g e s .��  ��   � k   �f � �  � � � X   �W ��� � � k   �R � �  � � � Q   � � � � � k   � � � �  � � � l  � ���������  ��  ��   �  ��� � O   � � � � � l  � � � � � � k   � � � �  � � � r   � � � � � n  � � � � � 1   � ���
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
msng�m  �l   � o      �i�i 0 nodimensions noDimensions �  � � � Z  P � ��h � � o  "�g�g 0 nodimensions noDimensions � r  %0 � � � b  %, � � � J  %( � �  ��f � o  %&�e�e 0 im  �f   � o  (+�d�d 0 skipped   � o      �c�c 0 skipped  �h   � Z  3P � ��b�a � l 3> ��`�_ � B  3>   ^  3: o  36�^�^ 0 w   o  69�]�] 0 h   m  := ?��������`  �_   � r  AL b  AH J  AD		 
�\
 o  AB�[�[ 0 im  �\   o  DG�Z�Z 0 pics   o      �Y�Y 0 pics  �b  �a   � �X l QQ�W�V�U�W  �V  �U  �X  �� 0 im   � o   � ��T�T 0 imagesel imageSel �  l XX�S�R�Q�S  �R  �Q    I Xc�P
�P .IPXSaddpnull���     **** o  X[�O�O 0 pics   �N�M
�N 
toAl o  ^_�L�L 0 theframealbum theFrameAlbum�M    l dd�K�J�I�K  �J  �I   �H L  df�G�G  �H  ��   $ m    �                                                                                  Phts  alis    0  Macintosh HD                   BD ����
Photos.app                                                     ����            ����  
 cu             Applications  !/:System:Applications:Photos.app/    
 P h o t o s . a p p    M a c i n t o s h   H D  System/Applications/Photos.app  / ��  ��  ��  ��       �F�F   �E
�E .aevtoappnull  �   � **** �D�C�B�A
�D .aevtoappnull  �   � **** k    g    !�@�@  �C  �B   �?�>�=�<�;�? 0 
errtexttwo 
errTexttwo�> 0 	errnumtwo 	errNumtwo�= 0 im  �< 0 errtext errText�; 0 errnum errNum ) �:�9�8�7�6�5�4�3�2�1�0 Q�/�.�-�, m�+ ��*�)�(�'�&�%�$ � ��# ��"�!� ����:  0 framealbumname FrameAlbumName
�9 .miscactvnull��� ��� null
�8 
IPct
�7 .coredoexnull���     ****
�6 
kocl
�5 
IPal
�4 
naME�3 
�2 .corecrel****      � null�1 0 theframealbum theFrameAlbum�0 0 
errtexttwo 
errTexttwo ���
� 
errn� 0 	errnumtwo 	errNumtwo�  
�/ 
ret 
�. .sysodlogaskr        TEXT
�- 
selc�, 0 imagesel imageSel�+ 0 pics  
�* 
cobj
�) .corecnte****       ****
�( 
phit�' 0 h  
�& 
pwid�% 0 w  �$ 0 errtext errText ���
� 
errn� 0 errnum errNum�  
�# .sysodelanull��� ��� nmbr
�" 
msng
�! 
bool�  0 nodimensions noDimensions� 0 skipped  
� 
toAl
� .IPXSaddpnull���     ****�Ah�E�O�`*j O '*��/j  *����� 
Y hO*��/E�OPW X  �%�%�%j O *a ,EE` W X  a �%�%�%j OjvE` O_ jv  )ja Y � �_ [�a l kh  � *a ,E` O*a ,E` UW QX  a �%�%�%a %j O #lj  O� *a ,E` O*a ,E` UW X  a !�%�%�%j OPO_ a " 
 _ a " a #&E` $O_ $ �kv_ %%E` %Y _ _ !a & �kv_ %E` Y hOP[OY�?O_ a '�l (OhUascr  ��ޭ