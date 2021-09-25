var hide = function (elem) {
  elem.setAttribute('class', 'hidden item-import-columns');
};

const updateOrder = () => {
  let items = document.querySelectorAll('.item-import-columns-live')
  for (let index = 0; index < items.length; index++) {
    const element = items[index];
    let button = element.querySelector('.button-column-remove')
    let order = element.querySelector('.order')
    button.innerHTML = index + 1;
    order.value = index + 1;
  }
}

const fetchColumns = (callback) => {
  fetch('/columns').then(function (response) {
    return response.json();
  }).then(data => {
    callback(data)
  }).catch(err => {
    console.warn('Something went wrong.', err);
    callback(null)
  });
}

const clickToRemove = (e, columns) => {
  let li = e.target.parentNode;
  hide(li)
  let destroy = li.querySelector("._destroy")
  if(destroy) destroy.value = "true"
  updateOrder()
  updateColumnsSelect(columns);
}

const getCurrentIndex = () => {
  return document.querySelectorAll('.item-import-columns').length
}

const getColumn = (columns, columnId) => {
  return columns.find(column => column.id == columnId)
}

const createLi = (columns) => {
  const currentIndex = getCurrentIndex();

  let selectedColumn = document.getElementById("selected-column");
  let currentColumn = getColumn(columns, selectedColumn.value);
  let li = document.createElement('li');
  li.className = "list-group-item d-flex justify-content-between align-items-center item-import-columns item-import-columns-live";
  let span = document.createElement('span');
  span.className = "column-name";
  span.innerHTML = currentColumn.name;
  let button = document.createElement('button');
  button.className = "btn btn-outline-danger button-column-remove";
  button.type = "button"
  button.addEventListener('click', e => clickToRemove(e, columns))

  let order = document.createElement('input');
  order.type = "hidden"
  order.className = "order"
  order.name = `import[import_columns_attributes][${currentIndex}][order]`
  order.id = `import_import_columns_attributes_${currentIndex}_order`

  let column_id = document.createElement('input');
  column_id.type = "hidden"
  column_id.className = "column_id"
  column_id.name = `import[import_columns_attributes][${currentIndex}][column_id]`
  column_id.id = `import_import_columns_attributes_${currentIndex}_column_id`
  column_id.value = currentColumn.id

  li.appendChild(span);
  li.appendChild(button);
  li.appendChild(order);
  li.appendChild(column_id);

  return li;
}

const updateColumnsSelect = (columns) => {
  let items = document.querySelectorAll('.item-import-columns-live')
  let column_ids = []
  let selectedColumn = document.getElementById("selected-column");
  selectedColumn.innerHTML = "<option value=''>Select something</option>";
  for (let index = 0; index < items.length; index++) {
    const element = items[index];
    let column_id = element.querySelector('.column_id')
    column_ids.push(column_id.value)
  }
  for (let index = 0; index < columns.length; index++) {
    const column = columns[index];
    console.log(column_ids, `${column.id}`)
    if(!column_ids.includes(`${column.id}`)) {
      let newOption = document.createElement("option");
      newOption.text = column.name;
      newOption.value = column.id;
      selectedColumn.appendChild(newOption);
    }
  }
}

document.addEventListener("turbolinks:load", function() {
  fetchColumns(columns => {
    const btnAddNewColumn = document.getElementById("button-add-new-column");
    const listOfColumns = document.getElementById("list-of-columns");
    btnAddNewColumn.addEventListener("click", () => {
      let selectedColumn = document.getElementById("selected-column");
      if(!selectedColumn.value) return
      listOfColumns.appendChild(createLi(columns));
      updateOrder();
      updateColumnsSelect(columns);
    })

    document.querySelectorAll('.button-column-remove').forEach(el => {
      el.addEventListener('click', e => clickToRemove(e, columns));
    })

    updateColumnsSelect(columns);
  })
});