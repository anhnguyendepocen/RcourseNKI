#!/bin/bash
#
# Unpack and set privileges to R_course folder on shark. Expects that the new $TGZ (R_course.tgz) 
# is on shark:/bam-export/R_course.pre.
#

TGZ=$1	

cd /bam-export/R_course.pre 
tar xvzf $TGZ 
chgrp -R 5-A-SHARK_BioCentEXP /bam-export/R_course.pre 
chmod -R o+rX,g+rwX /bam-export/R_course.pre 
chmod g+s /bam-export/R_course.pre/  
chmod g+s /bam-export/R_course.pre/*/
rm -rf /bam-export/R_course.post; 
mv /bam-export/R_course /bam-export/R_course.post; 
rm -rf /bam-export/R_course
mv /bam-export/R_course.pre /bam-export/R_course
