#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: send [commit] [reviewer]"
    exit 1
fi


commit="$1"
reviewer="$2"
# Get the commit message from the commit - just the one-line summary
commit_message=$(git log --format=%s -n 1 "${commit}")
# Convert the commit message into a suitable branch name
branch_name=$(echo "$commit_message" | \
    tr '[:upper:]' '[:lower:]' | \
    tr ' ' '-' | \
    tr -d "'")

# Translate the memorable username into the corresponding gitlab user id
if [ "${reviewer}" == "marco" ]; then
    reviewer_id=47
elif [ "${reviewer}" == "neil" ]; then
    reviewer_id=33
elif [ "${reviewer}" == "dunk" ]; then
    reviewer_id=45
elif [ "${reviewer}" == "cody" ]; then
    reviewer_id=50
elif [ "${reviewer}" == "lukasz" ]; then
    reviewer_id=48
elif [ "${reviewer}" == "vikas" ]; then
    reviewer_id=42
elif [ "${reviewer}" == "sam" ]; then
    reviewer_id=53
elif [ "${reviewer}" == "tom" ]; then
    reviewer_id=56
else
    echo "Unrecognised user"
    return
fi

set -ex

# echo "**** STASH ANY LOCAL WORK ****"
git stash

# echo "Creating branch $branch_name with $commit on it and message: '$commit_message', then creating an MR and assigning it to $reviewer"

# echo "**** CHECKOUT A NEW BRANCH ****"
git checkout -b "${branch_name}" master

# echo "**** CHERRY PICK THE SUPPLIED COMMIT ONTO THE NEW BRANCH ****"
git cherry-pick "${commit}"

# echo "**** PUSH THE NEW BRANCH UP TO ORIGIN ****"
git push -u origin "$branch_name"

# echo "**** CREATE A MERGE REQUEST ASSINGED TO THE SUPPLIED REVIEWER****"
/Users/dgordon/bin/gitlab/venv/bin/python -c "import gitlab; gitlab.Gitlab.from_config('researchexchange').projects.get(54).mergerequests.create({'source_branch': '$branch_name', 'target_branch': 'master', 'title': '$commit_message', 'assignee_id': $reviewer_id})"

# echo "**** SWITCH BACK TO THE ORIGINAL BRANCH ****"
git co -

# echo "**** POP THE STASH ****"
git stash pop

set +ex
