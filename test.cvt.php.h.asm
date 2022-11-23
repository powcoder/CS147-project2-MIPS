https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.data
      		A:        	.half      0x0001             # 2^-24
      		B:        	.half      0x0400         # 2^-14, smallest normal number
      		C:        	.float     5.96046448e-8			# 2^-24, smallest denormal number
      		D:        	.float     6.1035156E-5 			
      newline:        .asciiz     "\n"
      failure:  			.asciiz   "\n\ntest.cvt.php.h.asm   detects failure.\n"
      pass: 					.asciiz   "\n\ntest.cvt.php.h.asm   passes!\n"
.globl  test.cvt.php.h
.text
test.cvt.php.h:    

      		add       $sp,    	$sp,    -12
      		sw        $ra,    	($sp)     			#

      		la				$a0,			A       
					lh				$a0,			($a0)
      		jal       cvt.php.h         			#  	
					swc1			$f0,      4($sp)
#
      		la				$a0,			B       
					lh				$a0,			($a0)
      		jal       cvt.php.h         			#  	
					swc1			$f0,      8($sp)

verify:
					lwc1			$f0,      4($sp)
					l.s				$f1,			C
					c.eq.s		$f0,			$f1
				  bc1f      fail 


					lwc1			$f0,      8($sp)
					l.s				$f1,			D
					c.eq.s		$f0,			$f1
      		bc1t  	  okay

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

      		lw        $ra,   ($sp)     				#
      		add       $sp,    $sp,    	12
					jr				$ra

