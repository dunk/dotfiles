#!/bin/bash

function usage() {
    echo "Usage: send [reviewer]"
    echo "Usage: send [reviewer] [commit]"
    echo "[reviewer] == [marco|neil|dunk|cody|lukasz|vikas|sam|tom]"
}

# This script can be called in 1 and 2 argument forms only
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    usage
    exit 1
fi

# In 1 arg form we use the last commit in this branch
if [ $# -eq 1 ]; then
    # echo "Using the last commit in this branch"
    commit=$(git log --reverse -1 --pretty="format:%h")
else
    commit="$2"
fi

reviewer="$1"

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
    echo -e "Unrecognised reviewer\n"
    usage
    exit 1
fi

# Get the commit message from the commit - just the one-line summary
commit_message=$(git log --format=%s -n 1 "${commit}")

# Convert the commit message into a suitable branch name
branch_name=$(echo "$commit_message" | \
    tr '[:upper:]' '[:lower:]' | \
    tr ' ' '-' | \
    tr -d "'")

# set -ex

# echo "**** STASH ANY LOCAL WORK ****"
GIT_STASH_OUTPUT="$(git stash)"

# echo "Creating branch $branch_name with $commit on it and message: '$commit_message', then creating an MR and assigning it to $reviewer"

# echo "**** CHECKOUT A NEW BRANCH ****"
git checkout -b "${branch_name}" master

# echo "**** CHERRY PICK THE SUPPLIED COMMIT ONTO THE NEW BRANCH ****"
git cherry-pick "${commit}"

# echo "**** PUSH THE NEW BRANCH UP TO ORIGIN ****"
git push -u origin "$branch_name"

# echo "**** CREATE A MERGE REQUEST ASSINGED TO THE SUPPLIED REVIEWER****"
MERGE_REQUEST_ID=$(/Users/dgordon/bin/gitlab/venv/bin/python -c "import gitlab; print(gitlab.Gitlab.from_config('researchexchange').projects.get(54).mergerequests.create({'source_branch': '$branch_name', 'target_branch': 'master', 'title': '$commit_message', 'assignee_id': $reviewer_id}).get_id())")

# echo "**** SWITCH BACK TO THE ORIGINAL BRANCH ****"
git co -

# echo "**** POP THE STASH ****"
[ "$GIT_STASH_OUTPUT" != "No local changes to save" ] && git stash pop

echo "Merge request URL is: https://gitlab.rsrchx.org/researchexchange/rex/-/merge_requests/${MERGE_REQUEST_ID}"

# set +ex
