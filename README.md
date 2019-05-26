# email_list
Bash script to run a basic mailing list

## Requirements:
- Bash shell (can be adapted to other shells)
- `mailx`

## Installation:

1. Clone the repo:

```bash
$ git clone git@github.com:lukebarone/email_list.git
```

2. Edit the main shell script, and change the variables at the top to point to
your three files, and specify a subject / From email address. For more details,
refer to the [Files](#files) section.

3. Run the script:

```bash
$ email_list.sh
```

4. A preview appears. If you like the preview, press <kbd>Enter</kbd> to continue.
If you don't press <kbd>Ctrl</kbd>+<kbd>C</kbd> to cancel the script and fix your
message.

## <a name="files">Files</a>

The script relies on 3 files to be created, and the path/filenames specified in
the main shell script.

### email_list.txt

This file will be where you enter email addresses, one per line. The script will
cycle through this file, and send one email per line (prevents any sort of
address-leak)

### email_text.txt

This file accepts HTML. This is the main "body" of your message. This is the file
you will likely be editing the most.

### email_footer.txt

This file accepts HTML. This is the footer that is added to the end of your email.
For example, instructions on how to unsubscribe, or links to your website.

### email_list.sh

This is the main executable file. Please edit it to fill in the `SUBJECT`,
`FROM_EMAIL` variables, as well as the `LIST_FILE`, `BODY_FILE` and `FOOTER_FILE`
variables to the path/file name of the files. You can then send emails by running
the script:

```bash
$ ./email_list.sh
```
