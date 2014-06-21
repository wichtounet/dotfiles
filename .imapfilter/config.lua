function main()
    local account = IMAP {
        server = 'imap.gmail.com',
        username = 'baptiste.wicht@gmail.com',
        password = get_imap_password(".password.offlineimaprc"),
        ssl = 'ssl3',
    }

    -- Make sure the account is configured properly
    account.INBOX:check_status()

    -- Get all mail from INBOX
    mails = account.INBOX:select_all()

    -- ISOCPP mailing lists
    move_if_subject_contains(account, mails, "[std-proposals]", "ML/ISOCPP")
    move_if_subject_contains(account, mails, "[std-discussion]", "ML/ISOCPP")

    -- Boost mailing lists
    move_if_subject_contains(account, mails, "[Boost-users]", "ML/Boost")
    move_if_subject_contains(account, mails, "[Spirit-general]", "ML/Boost Spirit")

    -- Gentoo mailing lists
    move_if_subject_contains(account, mails, "[gentoo-announce]", "ML/Gentoo")
    move_if_subject_contains(account, mails, "[gentoo-amd64]", "ML/Gentoo")
    move_if_subject_contains(account, mails, "[gentoo-kernel]", "ML/Gentoo")

    -- Doxygen mailing list
    move_if_subject_contains(account, mails, "[Doxygen-users]", "ML/Doxygen")

    -- Mutt mailing list
    move_if_to_contains(account, mails, "mutt-users@mutt.org", "ML")
    
    -- Awesome mailing List
    move_if_to_contains(account, mails, "awesome@naquadah.org", "ML/Awesome")
end

function move_if_subject_contains(account, mails, subject, mailbox)
    filtered = mails:contain_subject(subject)
    filtered:move_messages(account[mailbox]);
end

function move_if_to_contains(account, mails, to, mailbox)
    filtered = mails:contain_to(to)
    filtered:move_messages(account[mailbox]);
end

-- Utility function to get IMAP password from file
function get_imap_password(file)
    local home = os.getenv("HOME")
    local file = home .. "/" .. file
    local str = io.open(file):read()
    return str;
end

main() -- Call the main function