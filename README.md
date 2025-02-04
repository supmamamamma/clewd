<div align="center">
<a href="https://github.com/teralomaniac/clewd">
<h1>Clewd - container</h1>
  <img
    height="120"
    width="120"
    alt="Clewd"
    title="Clewd"
    src="https://gitgud.io/ahsk/clewd/-/raw/master/media/logo.png"
    align="left"
  />

</a>

[原版 Clewd](https://gitgud.io/ahsk/clewd)
[修改版 Clewd](https://github.com/teralomaniac/clewd)

[Clewd 教程（必读）](https://rentry.org/teralomaniac_clewd)

Clewd 修改版及教程禁止转发任何包含收费项目的群组/论坛或用于收费项目
<br>

<hr>
<a>
   <img src="https://gitgud.io/ahsk/clewd/-/raw/master/media/program.png">
</a>
<h2><a href="https://gitgud.io/ahsk/clewd/-/blob/master/CHANGELOG.md">CHANGELOG</a></h2>
</div>

## Requirements

-   Docker and Docker Compose installed on your system
-   Basic familiarity with command line operations

## How to Use

#### Prerequisites

#### Installation Steps

1. **Create Project Directory**

    - Create a new folder for your project
    - Navigate to the folder in your terminal

2. **Set Up Configuration Files**

    - Download the required files to your project folder:
        - `docker-compose.yaml`
        - `config.js.example`
    - Copy `config.js.example` to `config.js`
    - Configure settings in `config.js`:
        - Update Cookie/CookieArray
        - Set IP address
        - Modify other settings as needed

3. **Launch the Application**

    ```sh
    # Using Docker Compose V2
    docker compose up -d

    # Or using legacy Docker Compose
    docker-compose up -d
    ```

#### Common Commands

View Logs

```sh
docker compose logs -f
# or
docker-compose logs -f
```

Restart Container

```sh
docker compose restart
# or
docker-compose restart
```

Stop and Remove Container

```sh
docker compose down
# or
docker-compose down
```

##### Important Notes

-   Always restart the container after modifying Cookie/CookieArray settings

## Defaults

### SettingName: (DEFAULT)/opt1/opt2...

-   `Superfetch`: (true)/false

    -   true will use an alternate method to get past the `We are unable to serve your request` error
    -   false won't use this method and you may get the error again

-   `PreventImperson`: (false)/true

    -   true trims the bot reply immediately if he says "Human:", "Assistant:", "H:" or "A:"
    -   making it so it doesn't hallucinate speaking as you **(chance of missing some spicy things)**

-   `PromptExperiments`: (true)/false

    -   true is an alternative way to send your prompt to the AI
    -   experiment before setting to false

-   `RetryRegenerate`: (false)/true

    -   true uses the AI's own retry mechanism when you regenerate on your frontend
    -   instead of a new conversation
    -   experiment with it

-   `SystemExperiments`: (true)/false

    -   only has any effect when `RenewAlways` is false
    -   true alternates between Main+JB+User and JB+User
    -   false doesn't alternate

-   `RenewAlways`: (true)/false

    -   true makes a new conversation context each time
    -   false _tries_ to reutilize the same old conversation, sending only your actual last message each time, taking into consideration `SystemExperiments`

-   `StripAssistant`: (false)/true

    -   true strips the "Assistant:" prefix from the last assistant message
    -   (check your log.txt to see where it is being stripped, not the same as pre 3.0)

-   `StripHuman`: (false)/true

    -   true strips the "Human:" prefix from the last human message

-   `AllSamples`: (false)/true

    -   mutually exclusive with `NoSamples`
    -   true converts all real dialogue to "sample dialogue" except the last Assistant and Human
    -   you're "H" and the AI is "A"
    -   whatever the AI replies with is kept (only outgoing)
    -   [see this](https://docs.anthropic.com/claude/docs/prompt-troubleshooting-checklist#the-prompt-is-formatted-correctly) for more information

    *   Human->H
    *   Assistant->A

-   `NoSamples`: (false)/true
    -   mutually exclusive with `AllSamples`
    -   true converts all "sample dialogue" to real dialogue
    -   you're "Human" and the AI is "Assistant"
    -   whatever the AI replies with is kept (only outgoing)
    -   [see this](https://docs.anthropic.com/claude/docs/prompt-troubleshooting-checklist#the-prompt-is-formatted-correctly) for more information
    *   H->Human
    *   A->Assistant
-   `LogMessages`: (false)/true

    -   true logs prompt and reply to `log.txt`

-   `ClearFlags`: (false)/true

    -   possibly snake-oil
    -   clears your warnings

-   `PassParams`: (false)/true

    -   true will send the temperature you set on your frontend
    -   only values under <=1.0 >= 0.1
    -   this could get your account banned
    -   if clewd stops working, set to false

-   `PreserveChats`: (false)/true
    -   true prevents the deletion of old chats at any point

## Examples

**safe setup**

> **PreventImperson**: false (higher chance of spicy stuff)

> **RenewAlways**: true

---

**experimental setup**

> **PromptExperiments**: true

> **SystemExperiments**: true

> **RetryRegenerate**: true

> **PreventImperson**: true

> **RenewAlways**: false

> **AllSamples**: true
