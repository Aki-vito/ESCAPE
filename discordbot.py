import discord

chrot = discord.Client()


@chrot.event
async def on_ready():
    print('Chrot is live')

@chrot.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content.startswith('$hello'):
        await message.channel.send('Hello!')



chrot.run('ODc5Mjk5OTM1MjgyMDI4NTU0.YSNt4Q.bU8ARNKqmXf0RuvmcPE40VxiVHc')
