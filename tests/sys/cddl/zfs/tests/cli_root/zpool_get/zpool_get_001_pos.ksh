#!/usr/local/bin/ksh93 -p
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

# $FreeBSD$

#
# Copyright 2008 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
# ident	"@(#)zpool_get_001_pos.ksh	1.3	08/05/14 SMI"
#

. $STF_SUITE/include/libtest.kshlib

################################################################################
#
# __stc_assertion_start
#
# ID:  zpool_get_001_pos
#
# DESCRIPTION:
#
# Zpool get usage message is displayed when called with no arguments
#
# STRATEGY:
#	1. Run zpool get
#	2. Check that exit status is set to 2
#	3. Check usage message contains text "usage"
#
# TESTABILITY: explicit
#
# TEST_AUTOMATION_LEVEL: automated
#
# CODING_STATUS: COMPLETED (2007-03-06)
#
# __stc_assertion_end
#
################################################################################

log_assert "Zpool get usage message is displayed when called with no arguments."

$ZPOOL get > /dev/null 2>&1 
RET=$?
if [ $RET != 2 ]
then
	log_fail "\"zpool get\" exit status $RET should be equal to 2."
fi

OUTPUT=$($ZPOOL get 2>&1 | $GREP -i usage)
RET=$?
if [ $RET != 0 ]
then
	log_fail "Usage message for zpool get did not contain the word 'usage'."
fi

log_pass "Zpool get usage message is displayed when called with no arguments."
