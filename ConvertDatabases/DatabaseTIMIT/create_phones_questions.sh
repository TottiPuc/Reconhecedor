#! /bin/bash 

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

discar_strange_phones=1

if [ "$discar_strange_phones" -eq 1 ]; then

	echo "b" >> $resultPath/monophones.txt
	echo "d" >> $resultPath/monophones.txt
	echo "g" >> $resultPath/monophones.txt
	echo "p" >> $resultPath/monophones.txt
	echo "t" >> $resultPath/monophones.txt
	echo "k" >> $resultPath/monophones.txt
	echo "jh" >> $resultPat/monophones.txt
	echo "ch" >> $resultPat/monophones.txt
	echo "s" >> $resultPath/monophones.txt
	echo "sh" >> $resultPat/monophones.txt
	echo "z" >> $resultPath/monophones.txt
	echo "zh" >> $resultPath/monophones.txt
	echo "f" >> $resultPath/monophones.txt
	echo "th" >> $resultPath/monophones.txt
	echo "v" >> $resultPath/monophones.txt
	echo "dh" >> $resultPath/monophones.txt
	echo "m" >> $resultPath/monophones.txt
	echo "n" >> $resultPath/monophones.txt
	echo "ng" >> $resultPath/monophones.txt
	echo "em" >> $resultPath/monophones.txt
	echo "en" >> $resultPath/monophones.txt
	echo "l" >> $resultPath/monophones.txt
	echo "r" >> $resultPath/monophones.txt
	echo "w" >> $resultPath/monophones.txt
	echo "y" >> $resultPath/monophones.txt
	echo "hh" >> $resultPath/monophones.txt
	echo "el" >> $resultPath/monophones.txt
	echo "iy" >> $resultPath/monophones.txt
	echo "ih" >> $resultPath/monophones.txt
	echo "eh" >> $resultPath/monophones.txt
	echo "ey" >> $resultPath/monophones.txt
	echo "ae" >> $resultPath/monophones.txt
	echo "aa" >> $resultPath/monophones.txt
	echo "aw" >> $resultPath/monophones.txt
	echo "ay" >> $resultPath/monophones.txt
	echo "ah" >> $resultPath/monophones.txt
	echo "ao" >> $resultPath/monophones.txt
	echo "oy" >> $resultPath/monophones.txt
	echo "ow" >> $resultPath/monophones.txt
	echo "uh" >> $resultPath/monophones.txt
	echo "uw" >> $resultPath/monophones.txt
	echo "er" >> $resultPath/monophones.txt
	echo "ax" >> $resultPath/monophones.txt
	echo "ix" >> $resultPath/monophones.txt
	echo "axr" >> $resultPath/monophones.txt
else
        echo "bcl" >> $resultPath/monophones.txt
        echo "dcl" >> $resultPath/monophones.txt
        echo "gcl" >> $resultPath/monophones.txt
        echo "kcl" >> $resultPath/monophones.txt
        echo "pcl" >> $resultPath/monophones.txt
        echo "tcl" >> $resultPath/monophones.txt
        echo "epi" >> $resultPath/monophones.txt
        echo "q" >> $resultPath/monophones.txt
        echo "pau" >> $resultPath/monophones.txt
        echo "eng" >> $resultPath/monophones.txt
        echo "nx" >> $resultPath/monophones.txt
        echo "axh" >> $resultPath/monophones.txt
        echo "dx" >> $resultPath/monophones.txt
        echo "hv" >> $resultPath/monophones.txt
        echo "ux" >> $resultPath/monophones.txt
fi

# make questions file, to help on triphone tying


echo "QS "L_Class-Stop"		{p-*,b-*,t-*,d-*,k-*,g-*}" >> $resultPath/questions.txt
echo "QS "L_Nasal"              {m-*,n-*,ng-*}" >> $resultPath/questions.txt
echo "QS "L_FricatAffricative"  {s-*,sh-*,z-*,zh-*,f-*,v-*,ch-*,jh-*,th-*,dh-*}" >> $resultPath/questions.txt
echo "QS "L_Liquid"             {l-*,el-*,r-*,ua-*,ia-*,w-*,y-*,hh-*}" >> $resultPath/questions.txt
echo "QS "L_Vowel"              {ey-*,ea-*,eh-*,ih-*,ao-*,ae-*,aa-*,oh-*,uw-*,ua-*,uh-*,er-*,ay-*,oy-*,iy-*,ia-*,aw-*,ow-*,ax-*,ah-*}" >> $resultPath/questions.txt
echo "QS "L_Silence"            {epi-*,pau-*,h#-*,#h-*}" >> $resultPath/questions.txt
echo "QS "L_C-Front"            {p-*,b-*,m-*,f-*,v-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_C-Central"          {t-*,d-*,n-*,s-*,z-*,zh-*,th-*,dh-*,l-*,el-*,r-*,ua-*,ia-*}" >> $resultPath/questions.txt
echo "QS "L_C-Back"             {sh-*,ch-*,jh-*,y-*,k-*,g-*,ng-*,hh-*}" >> $resultPath/questions.txt
echo "QS "L_V-Front"            {iy-*,ia-*,ih-*,ey-*,ea-*,eh-*}" >> $resultPath/questions.txt
echo "QS "L_V-Central"          {ae-*,oh-*,aa-*,er-*,ao-*}" >> $resultPath/questions.txt
echo "QS "L_V-Back"             {uw-*,ua-*,uh-*,ow-*,ax-*,ah-*}" >> $resultPath/questions.txt
echo "QS "L_Front"              {p-*,b-*,m-*,f-*,v-*,w-*,iy-*,ia-*,ih-*,ey-*,ea-*,eh-*}" >> $resultPath/questions.txt
echo "QS "L_Central"            {t-*,d-*,n-*,s-*,z-*,zh-*,th-*,dh-*,l-*,el-*,r-*,ua-*,ia-*,ae-*,aa-*,er-*,ao-*}" >> $resultPath/questions.txt
echo "QS "L_Back"               {sh-*,ch-*,jh-*,y-*,k-*,g-*,ng-*,hh-*,oh-*,uw-*,ua-*,uh-*,ow-*,ax-*,ah-*}" >> $resultPath/questions.txt
echo "QS "L_Fortis"             {p-*,t-*,k-*,f-*,th-*,s-*,sh-*,ch-*}" >> $resultPath/questions.txt
echo "QS "L_Lenis"              {b-*,d-*,g-*,v-*,dh-*,z-*,zh-*,jh-*}" >> $resultPath/questions.txt
echo "QS "L_UnFortLenis"        {m-*,n-*,ng-*,hh-*,l-*,el-*,r-*,ua-*,ia-*,y-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_Coronal"            {t-*,d-*,n-*,th-*,dh-*,s-*,z-*,sh-*,zh-*,ch-*,jh-*,el-*,l-*,r-*,ua-*,ia-*}" >> $resultPath/questions.txt
echo "QS "L_NonCoronal"         {p-*,b-*,m-*,k-*,g-*,ng-*,f-*,v-*,hh-*,y-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_Anterior"           {p-*,b-*,m-*,t-*,d-*,n-*,f-*,v-*,th-*,dh-*,s-*,z-*,l-*,el-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_NonAnterior"        {k-*,g-*,ng-*,sh-*,zh-*,hh-*,ch-*,jh-*,r-*,ua-*,ia-*,y-*}" >> $resultPath/questions.txt
echo "QS "L_Continuent"         {m-*,n-*,ng-*,f-*,v-*,th-*,dh-*,s-*,z-*,sh-*,zh-*,hh-*,l-*,el-*,r-*,ua-*,ia-*,y-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_NonContinuent"      {p-*,b-*,t-*,d-*,k-*,g-*,ch-*,jh-*}" >> $resultPath/questions.txt
echo "QS "L_Strident"           {s-*,z-*,sh-*,zh-*,ch-*,jh-*}" >> $resultPath/questions.txt
echo "QS "L_NonStrident"        {f-*,v-*,th-*,dh-*,hh-*}" >> $resultPath/questions.txt
echo "QS "L_UnStrident"         {p-*,b-*,m-*,t-*,d-*,n-*,k-*,g-*,ng-*,l-*,el-*,r-*,ua-*,ia-*,y-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_Glide"              {hh-*,l-*,el-*,r-*,ua-*,ia-*,y-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_Syllabic"           {el-*,er-*}" >> $resultPath/questions.txt
echo "QS "L_Unvoiced-cons"      {p-*,t-*,k-*,s-*,sh-*,f-*,th-*,hh-*,ch-*}" >> $resultPath/questions.txt
echo "QS "L_Voiced-cons"        {jh-*,b-*,d-*,dh-*,g-*,y-*,l-*,el-*,m-*,n-*,ng-*,r-*,ua-*,ia-*,v-*,w-*,z-*}" >> $resultPath/questions.txt
echo "QS "L_Unvoiced-all"       {p-*,t-*,k-*,s-*,sh-*,f-*,th-*,hh-*,ch-*,sil-*,sp-*}" >> $resultPath/questions.txt
echo "QS "L_Long"               {iy-*,ia-*,ow-*,aw-*,ao-*,uw-*,ua-*,el-*}" >> $resultPath/questions.txt
echo "QS "L_Short"              {ae-*,ey-*,ea-*,aa-*,eh-*,ih-*,ay-*,oy-*,oh-*,ax-*,ah-*,uh-*}" >> $resultPath/questions.txt
echo "QS "L_Dipthong"           {ey-*,ea-*,ay-*,oy-*,aw-*,er-*,el-*}" >> $resultPath/questions.txt
echo "QS "L_Front-Start"        {ey-*,ea-*,aw-*,er-*}" >> $resultPath/questions.txt
echo "QS "L_Fronting"           {ay-*,ey-*,ea-*,oy-*}" >> $resultPath/questions.txt
echo "QS "L_High"               {ih-*,uw-*,ua-*,uh-*,iy-*,ia-*}" >> $resultPath/questions.txt
echo "QS "L_Medium"             {ey-*,ea-*,er-*,ax-*,ah-*,ow-*,eh-*,el-*}" >> $resultPath/questions.txt
echo "QS "L_Low"                {ae-*,ay-*,aw-*,aa-*,oh-*,ao-*,oy-*}" >> $resultPath/questions.txt
echo "QS "L_Rounded"            {ao-*,uw-*,ua-*,uh-*,oy-*,ow-*,w-*}" >> $resultPath/questions.txt
echo "QS "L_Unrounded"          {eh-*,ih-*,ae-*,aa-*,oh-*,er-*,ay-*,ey-*,ea-*,iy-*,ia-*,aw-*,ax-*,ah-*,hh-*,l-*,el-*,r-*,ua-*,ia-*,y-*}" >> $resultPath/questions.txt
echo "QS "L_Fricative"          {s-*,sh-*,z-*,zh-*,f-*,v-*,th-*,dh-*}" >> $resultPath/questions.txt
echo "QS "L_Affricate"          {ch-*,jh-*}" >> $resultPath/questions.txt
echo "QS "L_IVowel"             {ih-*,iy-*,ia-*}" >> $resultPath/questions.txt
echo "QS "L_EVowel"             {ey-*,ea-*,eh-*}" >> $resultPath/questions.txt
echo "QS "L_AVowel"             {ae-*,aa-*,oh-*,er-*,ay-*,aw-*}" >> $resultPath/questions.txt
echo "QS "L_OVowel"             {ao-*,oy-*,ow-*}" >> $resultPath/questions.txt
echo "QS "L_UVowel"             {ax-*,ah-*,el-*,uh-*,uw-*,ua-*}" >> $resultPath/questions.txt
echo "QS "L_Voiced-Stop"        {b-*,d-*,g-*}" >> $resultPath/questions.txt
echo "QS "L_Unvoiced-Stop"      {p-*,t-*,k-*}" >> $resultPath/questions.txt
echo "QS "L_Front-Stop"         {p-*,b-*}" >> $resultPath/questions.txt
echo "QS "L_Central-Stop"       {t-*,d-*}" >> $resultPath/questions.txt
echo "QS "L_Back-Stop"          {k-*,g-*}" >> $resultPath/questions.txt
echo "QS "L_Voiced-Fricative"   {z-*,zh-*,dh-*,ch-*,v-*}" >> $resultPath/questions.txt
echo "QS "L_Unvoiced-Fricative" {s-*,sh-*,th-*,f-*,ch-*}" >> $resultPath/questions.txt
echo "QS "L_Front-Fricative"    {f-*,v-*}" >> $resultPath/questions.txt
echo "QS "L_Central-Fricative"  {s-*,z-*,th-*,dh-*}" >> $resultPath/questions.txt
echo "QS "L_Back-Fricative"     {sh-*,zh-*,ch-*,jh-*}" >> $resultPath/questions.txt
echo "QS "R_Class-Stop"         {*+p,*+b,*+t,*+d,*+k,*+g}" >> $resultPath/questions.txt
echo "QS "R_Nasal"              {*+m,*+n,*+ng}" >> $resultPath/questions.txt
echo "QS "R_FricatAffricative"  {*+s,*+sh,*+z,*+zh,*+f,*+v,*+ch,*+jh,*+th,*+dh}" >> $resultPath/questions.txt
echo "QS "R_Liquid"             {*+l,*+el,*+r,*+ua,*+ia,*+w,*+y,*+hh}" >> $resultPath/questions.txt
echo "QS "R_Vowel"              {*+ey,*+ea,*+eh,*+ih,*+ao,*+ae,*+aa,*+oh,*+uw,*+ua,*+uh,*+er,*+ay,*+oy,*+iy,*+ia,*+aw,*+ow,*+ax,*+ah}" >> $resultPath/questions.txt
echo "QS "R_Silence"            {epi-*,pau-*,h#-*,#h-*}" >> $resultPath/questions.txt
echo "QS "R_C-Front"            {*+p,*+b,*+m,*+f,*+v,*+w}" >> $resultPath/questions.txt
echo "QS "R_C-Central"          {*+t,*+d,*+n,*+s,*+z,*+zh,*+th,*+dh,*+l,*+el,*+r,*+ua,*+ia}" >> $resultPath/questions.txt
echo "QS "R_C-Back"             {*+sh,*+ch,*+jh,*+y,*+k,*+g,*+ng,*+hh}" >> $resultPath/questions.txt
echo "QS "R_V-Front"            {*+iy,*+ia,*+ih,*+ey,*+ea,*+eh}" >> $resultPath/questions.txt
echo "QS "R_V-Central"          {*+ae,*+oh,*+aa,*+er,*+ao}" >> $resultPath/questions.txt
echo "QS "R_V-Back"             {*+uw,*+ua,*+uh,*+ow,*+ax,*+ah}" >> $resultPath/questions.txt
echo "QS "R_Front"              {*+p,*+b,*+m,*+f,*+v,*+w,*+iy,*+ia,*+ih,*+ey,*+ea,*+eh}" >> $resultPath/questions.txt
echo "QS "R_Central"            {*+t,*+d,*+n,*+s,*+z,*+zh,*+th,*+dh,*+l,*+el,*+r,*+ua,*+ia,*+ae,*+aa,*+er,*+ao}" >> $resultPath/questions.txt
echo "QS "R_Back"               {*+sh,*+ch,*+jh,*+y,*+k,*+g,*+ng,*+hh,*+oh,*+uw,*+ua,*+uh,*+ow,*+ax,*+ah}" >> $resultPath/questions.txt
echo "QS "R_Fortis"             {*+p,*+t,*+k,*+f,*+th,*+s,*+sh,*+ch}" >> $resultPath/questions.txt
echo "QS "R_Lenis"              {*+b,*+d,*+g,*+v,*+dh,*+z,*+zh,*+jh}" >> $resultPath/questions.txt
echo "QS "R_UnFortLenis"        {*+m,*+n,*+ng,*+hh,*+l,*+el,*+r,*+ua,*+ia,*+y,*+w}" >> $resultPath/questions.txt
echo "QS "R_Coronal"            {*+t,*+d,*+n,*+th,*+dh,*+s,*+z,*+sh,*+zh,*+ch,*+jh,*+el,*+l,*+r,*+ua,*+ia}" >> $resultPath/questions.txt
echo "QS "R_NonCoronal"         {*+p,*+b,*+m,*+k,*+g,*+ng,*+f,*+v,*+hh,*+y,*+w}" >> $resultPath/questions.txt
echo "QS "R_Anterior"           {*+p,*+b,*+m,*+t,*+d,*+n,*+f,*+v,*+th,*+dh,*+s,*+z,*+l,*+el,*+w}" >> $resultPath/questions.txt
echo "QS "R_NonAnterior"        {*+k,*+g,*+ng,*+sh,*+zh,*+hh,*+ch,*+jh,*+r,*+ua,*+ia,*+y}" >> $resultPath/questions.txt
echo "QS "R_Continuent"         {*+m,*+n,*+ng,*+f,*+v,*+th,*+dh,*+s,*+z,*+sh,*+zh,*+hh,*+l,*+el,*+r,*+ua,*+ia,*+y,*+w}" >> $resultPath/questions.txt
echo "QS "R_NonContinuent"      {*+p,*+b,*+t,*+d,*+k,*+g,*+ch,*+jh}" >> $resultPath/questions.txt
echo "QS "R_Strident"           {*+s,*+z,*+sh,*+zh,*+ch,*+jh}" >> $resultPath/questions.txt
echo "QS "R_NonStrident"        {*+f,*+v,*+th,*+dh,*+hh}" >> $resultPath/questions.txt
echo "QS "R_UnStrident"         {*+p,*+b,*+m,*+t,*+d,*+n,*+k,*+g,*+ng,*+l,*+el,*+r,*+ua,*+ia,*+y,*+w}" >> $resultPath/questions.txt
echo "QS "R_Glide"              {*+hh,*+l,*+el,*+r,*+ua,*+ia,*+y,*+w}" >> $resultPath/questions.txt
echo "QS "R_Syllabic"           {*+el,*+er}" >> $resultPath/questions.txt
echo "QS "R_Unvoiced-cons"      {*+p,*+t,*+k,*+s,*+sh,*+f,*+th,*+hh,*+ch}" >> $resultPath/questions.txt
echo "QS "R_Voiced-cons"        {*+jh,*+b,*+d,*+dh,*+g,*+y,*+l,*+el,*+m,*+n,*+ng,*+r,*+ua,*+ia,*+v,*+w,*+z}" >> $resultPath/questions.txt
echo "QS "R_Unvoiced-all"       {*+p,*+t,*+k,*+s,*+sh,*+f,*+th,*+hh,*+ch,*+sil,*+sp}" >> $resultPath/questions.txt
echo "QS "R_Long"               {*+iy,*+ia,*+ow,*+aw,*+ao,*+uw,*+ua,*+el}" >> $resultPath/questions.txt
echo "QS "R_Short"              {*+ae,*+ey,*+ea,*+aa,*+eh,*+ih,*+ay,*+oy,*+oh,*+ax,*+ah,*+uh}" >> $resultPath/questions.txt
echo "QS "R_Dipthong"           {*+ey,*+ea,*+ay,*+oy,*+aw,*+er,*+el}" >> $resultPath/questions.txt
echo "QS "R_Front-Start"        {*+ey,*+ea,*+aw,*+er}" >> $resultPath/questions.txt
echo "QS "R_Fronting"           {*+ay,*+ey,*+ea,*+oy}" >> $resultPath/questions.txt
echo "QS "R_High"               {*+ih,*+uw,*+ua,*+uh,*+iy,*+ia}" >> $resultPath/questions.txt
echo "QS "R_Medium"             {*+ey,*+ea,*+er,*+ax,*+ah,*+ow,*+eh,*+el}" >> $resultPath/questions.txt
echo "QS "R_Low"                {*+ae,*+ay,*+aw,*+aa,*+oh,*+ao,*+oy}" >> $resultPath/questions.txt
echo "QS "R_Rounded"            {*+ao,*+uw,*+ua,*+uh,*+oy,*+ow,*+w}" >> $resultPath/questions.txt
echo "QS "R_Unrounded"          {*+eh,*+ih,*+ae,*+aa,*+oh,*+er,*+ay,*+ey,*+ea,*+iy,*+ia,*+aw,*+ax,*+ah,*+hh,*+l,*+el,*+r,*+ua,*+ia,*+y}" >> $resultPath/questions.txt
echo "QS "R_Fricative"          {*+s,*+sh,*+z,*+zh,*+f,*+v,*+th,*+dh}" >> $resultPath/questions.txt
echo "QS "R_Affricate"          {*+ch,*+jh}" >> $resultPath/questions.txt
echo "QS "R_IVowel"             {*+ih,*+iy,*+ia}" >> $resultPath/questions.txt
echo "QS "R_EVowel"             {*+ey,*+ea,*+eh}" >> $resultPath/questions.txt
echo "QS "R_AVowel"             {*+ae,*+aa,*+oh,*+er,*+ay,*+aw}" >> $resultPath/questions.txt
echo "QS "R_OVowel"             {*+ao,*+oy,*+ow}" >> $resultPath/questions.txt
echo "QS "R_UVowel"             {*+ax,*+ah,*+el,*+uh,*+uw,*+ua}" >> $resultPath/questions.txt
echo "QS "R_Voiced-Stop"        {*+b,*+d,*+g}" >> $resultPath/questions.txt
echo "QS "R_Unvoiced-Stop"      {*+p,*+t,*+k}" >> $resultPath/questions.txt
echo "QS "R_Front-Stop"         {*+p,*+b}" >> $resultPath/questions.txt
echo "QS "R_Central-Stop"       {*+t,*+d}" >> $resultPath/questions.txt
echo "QS "R_Back-Stop"          {*+k,*+g}" >> $resultPath/questions.txt
echo "QS "R_Voiced-Fricative"   {*+z,*+zh,*+dh,*+ch,*+v}" >> $resultPath/questions.txt
echo "QS "R_Unvoiced-Fricative" {*+s,*+sh,*+th,*+f,*+ch}" >> $resultPath/questions.txt
echo "QS "R_Front-Fricative"    {*+f,*+v}" >> $resultPath/questions.txt
echo "QS "R_Central-Fricative"  {*+s,*+z,*+th,*+dh}" >> $resultPath/questions.txt
echo "QS "R_Back-Fricative"     {*+sh,*+zh,*+ch,*+jh}" >> $resultPath/questions.txt



