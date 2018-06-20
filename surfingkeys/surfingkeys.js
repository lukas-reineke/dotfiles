// // an example to create a new mapping `ctrl-y`
// mapkey('<Ctrl-y>', 'Show me the money', function() {
//   Front.showPopup(
//     'a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).',
//   );
// });

// mapkey('<Space>', 'Choose a tab with omnibar', function() {
//     Front.openOmnibar({ type: 'Tabs' });
// });

mapkey(
    'yg',
    '#7 git clone - git clone address',
    () => Clipboard.write('git clone ' + window.location.href + '.git'),
    { domain: /github\.com/i },
);

let stackAnswer = 0;

mapkey(
    'D',
    'stackoverflow next answer',
    () => {
        pageHeadLine = document.querySelectorAll('.answer');
        if (pageHeadLine.length > stackAnswer) {
            stackAnswer++;
        }
        pageHeadLine[stackAnswer].scrollIntoView();
        window.scrollBy(0, -47); // Adjust scrolling with a negative value : stackoverflow upper bar
    },
    { domain: /stackoverflow\.com/i },
);

mapkey(
    'U',
    'stackoverflow prev answer',
    () => {
        pageHeadLine = document.querySelectorAll('.answer');
        if (0 < stackAnswer) {
            stackAnswer--;
        }
        pageHeadLine[stackAnswer].scrollIntoView();
        window.scrollBy(0, -47); // Adjust scrolling with a negative value here : stackoverflow upper bar
    },
    { domain: /stackoverflow\.com/i },
);

// Front.registerInlineQuery({
//     url: 'https://api.shanbay.com/bdc/search/?word=',
//     parseResult: function(res) {
//         try {
//             res = JSON.parse(res.text);
//             var exp = res.msg;
//             if (res.data.definition) {
//                 var pronunciations = [];
//                 for (var reg in res.data.pronunciations) {
//                     pronunciations.push(
//                         `<div>[${reg}] ${res.data.pronunciations[reg]}</div>`,
//                     );
//                     // pronunciations.push(`<div><audio src="${res.data[reg+'_audio']}" controls></audio></div>`);
//                 }
//                 var definition = res.data.definition
//                     .split('\n')
//                     .map(function(d) {
//                         return `<li>${d}</li>`;
//                     })
//                     .join('');
//                 exp = `${pronunciations.join('')}<ul>${definition}</ul>`;
//             }
//             if (res.data.en_definitions) {
//                 exp += '<hr/>';
//                 for (var lex in res.data.en_definitions) {
//                     var sense = res.data.en_definitions[lex]
//                         .map(function(s) {
//                             return `<li>${s}</li>`;
//                         })
//                         .join('');
//                     exp += `<div>${lex}</div><ul>${sense}</ul>`;
//                 }
//             }
//             return exp;
//         } catch (e) {
//             return '';
//         }
//     },
// });
// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
// map('gt', 'T');
// unmap('H')
// unmap('L')
// map('H', '_')
// map('L', '$')
// mapkey('H', '#4Go back in history', () => history.go(-1));
// mapkey('L', '#4Go forward in history', () => history.go(1));

map('H', 'S');
map('L', 'D');

mapkey('gT', '#3Go one tab left', () => RUNTIME('previousTab'));
mapkey('gt', '#3Go one tab right', () => RUNTIME('nextTab'));

map(']', ']]');
map('[', '[[');

cmap('<Ctrl-n>', '<Tab>');
cmap('<Ctrl-p>', '<Shift-Tab>');

// map('<Ctrl-space>', 't')

imap('H', '_');
imap('L', '$');
// imap('<Ctrl-w>', '<Alt-w>');

vmap('H', '0');
vmap('L', '$');

aceVimMap('H', '_', 'normal');
aceVimMap('L', '$', 'normal');

addSearchAliasX(
    'L',
    'Im feeling lucky',
    'https://www.google.com/search?btnI=1&q=',
);

addSearchAliasX(
    't',
    'translate 日本語 to English',
    'https://translate.google.com/?hl=jp#ja/en/',
);
addSearchAliasX(
    'T',
    'translate English to 日本語',
    'https://translate.google.com/?hl=jp#en/ja/',
);
// vmap('J', '5j')
// vmap('K', '5k')
// an example to remove mapkey `Ctrl-i`
// unmap('<Ctrl-i>');

unmap('T');

settings.scrollStepSize = 100;
settings.blacklistPattern = /.*localhost.*/i;
settings.focusAfterClosed = 'left';
settings.historyMUOrder = false;
settings.richHintsForKeystroke = 0;
settings.omnibarMaxResults = 5;
settings.focusFirstCandidate = true;
Hints.numericHints = false;
Hints.characters = 'asdfghjklqwertyuiopzxcvbnm';

////////////////////////////////////////////////////////////////
// github default shortcut lists                              //
// https:help.github.com/articles/using-keyboard-shortcuts/   //
////////////////////////////////////////////////////////////////

mapkey(
    'gC',
    'Go to the code tab',
    () => {
        document
            .querySelectorAll('.js-selected-navigation-item.reponav-item')[0]
            .click();
    },
    { domain: /github\.com/i },
);

mapkey(
    'gI',
    'Go to the Issues tab. ',
    () => {
        document
            .querySelectorAll('.js-selected-navigation-item.reponav-item')[1]
            .click();
    },
    { domain: /github\.com/i },
);

mapkey(
    'gP',
    'Go to the Pull requests tab.  ',
    () => {
        document
            .querySelectorAll('.js-selected-navigation-item.reponav-item')[2]
            .click();
    },
    { domain: /github\.com/i },
);

mapkey(
    'gB',
    'Go to the Projects tab. "',
    () => {
        document
            .querySelectorAll('.js-selected-navigation-item.reponav-item')[3]
            .click();
    },
    { domain: /github\.com/i },
);

mapkey(
    'gW',
    'Go to the Wiki tab. ',
    () => {
        document
            .querySelectorAll('.js-selected-navigation-item.reponav-item')[4]
            .click();
    },
    { domain: /github\.com/i },
);

mapkey(
    'gO',
    'Go to the Overview tab. ',
    () => {
        document.querySelectorAll('.UnderlineNav-item')[0].click();
    },
    { domain: /github\.com/i },
);
mapkey(
    'gR',
    'Go to the Repository tab. ',
    () => {
        document.querySelectorAll('.UnderlineNav-item')[1].click();
    },
    { domain: /github\.com/i },
);
mapkey(
    'gS',
    'Go to the Stars tab. ',
    () => {
        document.querySelectorAll('.UnderlineNav-item')[2].click();
    },
    { domain: /github\.com/i },
);

//////////////////
// end of github//
//////////////////
const colors = {
    dark_black: '#1a1a1a',
    black: '#1f1f1f',
    white: '#d9dce0',
    green: '#98C379',
    blue: '#61AFEF',
    red: '#E06C75',
    grey: '#2C323C',
};

// set theme
settings.theme = `
.sk_theme input {
    font-family: "Fira Code";
}
.sk_theme {
    background: ${colors.black};
    color: #8C919A;
}
.sk_theme tbody {
    color: ${colors.black};
}
.sk_theme input {
    color: ${colors.white};
}
.sk_theme .url {
    color: ${colors.grey};
    padding: 5px;
    padding-left: 20px;
    overflow: hidden;
}
.sk_theme .annotation {
    color: ${colors.green};
}

.sk_omnibar_middle #sk_omnibarSearchArea {
    margin: 1.5rem 1rem;
    border-bottom: 1px solid #8C919A;
}
.sk_theme .omnibar_visitcount {
    color: ${colors.blue};
}
.sk_theme .omnibar_timestamp {
    color: ${colors.red};
}

#sk_omnibarSearchResult li.focused div.url {
    white-space: nowrap;
}

#sk_omnibarSearchResult li div.title {
    white-space: nowrap;
}

#sk_omnibarSearchResult>ul>li,
.sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    padding-botton: 20px;
    font-family: "Fira Code";
    font-size: 18px;
    background: ${colors.black};
    overflow: hidden;
}
.sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: ${colors.dark_black};
}
.sk_theme .omnibar_highlight {
    color: ${colors.green};
}
.sk_theme ul>li {
    background-color: ${colors.black};
}
`;

const textStyle = `
    border: solid 3px ${colors.black};
    color: ${colors.green};
    background: initial;
    background-color: ${colors.black};
`;

Hints.style(textStyle, 'text');
Hints.style(textStyle);

Visual.style('marks', `background-color: ${colors.green};`);
Visual.style('cursor', `background-color: ${colors.green};`);
