# Controllers

Controllers are the ruby code that runs for each URL your user visit. You need a method for each route on this model.

## `index` and `show`

Both `index` and `show` are very straightforward. Find the record (or records) to be displayed, and set them to an instance variable. Then (optionally) call `render :index` or `render :show` to render the associated view. Rails will by default render the same name as the method, so you can drop if desired.

Make sure to set the record(s) to instance variables so the view can access them.

## `new` and `edit`

`new` and `edit` are very similar to `index` and `show` in that you are simply finding a record and sending it to the corresponding view. For `new`, instead of finding a record, set an instance variable to `Thing.new`.

## `create` and `update`

These methods both take input from a form and create or update a record using the data given.

If successful, you'll want to `redirect_to` and appropriate URL. Likely `things_url`, which is the `index`.

If unsuccessful, store the errors with:
```
flash.now[:errors] = @thing.errors.full_messages
```
Then `render` an appropriate view. Probably `new` or `edit`, which will restart the process. Optionally you can `flash[:errors]` and `redirect_to` a URL. It's generally better to `render` if you can though.

### `create`
```
@thing = Thing.new(thing_params)
if @thing.save
...
```

### `update`
```
@thing = Thing.find_by(id: params[:id])
if @thing.update_attributes(thing_params)
...
```

### A Note on Flash

`flash` is a special cookie that rails has set aside. It will only store data it is given for one request-response cycle. `flash.now` will only persist data until the end of the current request-response cycle. Use `flash` with a `redirect_to` and `flash.now` with a `render`.

## `destroy`

Pretty easy! Find the record in question by `params[:id]`, then `.destroy` it. You want to use `.destroy` as opposed to `.delete` to ensure dependent records are also destroyed.

After this is done, `redirect_to` an appropriate URL. Probably `things_url` which points to the `index`.

## Strong Params

It's a good idea to make a private method, usually called `thing_params` that will ensure no extraneous parameters are being sent to your `create` and `update` methods. The format for strong params are as follows:

```
def thing_params
    params.require(:thing).permit(:field1, :field2, :field3)
end
```

## With Auth

Coming soon!
