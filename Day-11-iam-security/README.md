# Day 11 – AWS IAM & Security

## Objective
Implement AWS IAM best practices by creating a non-root IAM user with least-privilege access and validating permissions across AWS services.

## What Was Done
- Created an IAM user (`devops-user`)
- Assigned permissions using IAM Groups
- Applied least-privilege access model
- Verified access to:
  - EC2
  - S3
- Restricted access to IAM for security
- Logged in using IAM Sign-in URL
- Validated permissions practically

## AWS Services Used
- AWS IAM
- EC2
- S3

## Security Best Practices Implemented
- Avoided root user usage
- Used IAM groups instead of direct policies
- Enforced least-privilege principle
- Verified denied access where required

## Key Learnings
- Difference between IAM Users, Groups, and Policies
- How AWS permission boundaries work
- Why least privilege is critical in production
- How DevOps engineers secure cloud environments

## Interview Questions Covered
1. What is IAM and why is it important?
2. What is least privilege access?
3. Difference between IAM role and IAM user?
4. Why should we avoid using root user?
5. How do IAM policies work?

## Status
✅ Completed successfully

