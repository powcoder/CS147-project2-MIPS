https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.data
      		A:        	.word			0x7C00FC00
      		C:        	.word      0xFF800000 
      		D:        	.word      0x7F800000 
      newline:        .asciiz     "\n"
      failure:  			.asciiz   "\n\ntest.cvt.php.h.infty.asm   detects failure.\n"
      pass: 					.asciiz   "\n\ntest.cvt.php.h.infty.asm   passes!\n"
.globl  test.cvt.php.h.infty
.text
test.cvt.php.h.infty:    

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

