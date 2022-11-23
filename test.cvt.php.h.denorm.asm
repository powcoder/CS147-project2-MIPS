https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.data
      		A:        	.word			0x00018001  	#	(-2^-24, +2^-24)
      		C:        	.word      0xb3800000 	# (1  011 0011 1 000 0000 0000 0000 0000 0000)
      		D:        	.word      0x33800000 
      newline:        .asciiz     "\n"
      failure:  			.asciiz   "\n\ntest.cvt.php.h.denorm.asm   detects failure.\n"
      pass: 					.asciiz   "\n\ntest.cvt.php.h.denorm.asm   passes!\n"
.globl  test.cvt.php.h.denorm
.text
test.cvt.php.h.denorm:    

      		add       $sp,    	$sp,    -12
      		sw        $ra,    	($sp)     			#

      		la				$a0,			A       
					lh				$a0,			($a0)
      		jal       cvt.php.h         			#  	
					swc1			$f0,      4($sp)
#
      		la				$a0,			A       
					lh				$a0,			2($a0)
      		jal       cvt.php.h         			#  	
					swc1			$f0,      8($sp)

verify:
					lwc1			$f0,      4($sp)
					l.s				$f1,			C
					mfc1			$t0,			$f0
					mfc1			$t1,			$f1

					bne				$t0,			$t1,		fail


					lwc1			$f0,      8($sp)
					l.s				$f1,			D
					mfc1			$t0,			$f0
					mfc1			$t1,			$f1

					beq				$t0,			$t1,		okay

fail:
      		la        $a0,      failure
      		li        $v0,      4
      		syscall                     # print  newline
      		j         RETURN

okay:
      		la        $a0,      	pass
      		li        $v0,      	4
      		syscall                     				# print  pass
					
RETURN:
      		#li        $v0,      10
      		#syscall                     # print  newline

      		lw        $ra,   ($sp)     				#
      		add       $sp,    $sp,    	12
					jr				$ra

