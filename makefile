#  * NoMail.
#  *
#  * NoMail is a free extension for CMS Opencart 3.x.
#  * It allows to completely disable mail sending.
#  *
#  * @author		Andrii Burkatskyi aka underr underr.ua@gmail.com
#  * @copyright		Copyright (c) 2018-2019 Andrii Burkatskyi
#  * @license		https://raw.githubusercontent.com/underr-ua/ocmod3-nomail/master/LICENSE.txt MIT
#  *
#  * @version		1.0
#  *
#  * @see			https://underr.space/notes/projects/project-005.html
#  * @see			https://github.com/underr-ua/ocmod3-nomail

zip=$(shell basename `pwd`).ocmod.zip

license=LICENSE.txt
readme=README.md
datetime=201901010000.00
src=src
bin=bin


all: clean makedir timestamp makezip

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
